import cv2
import numpy as np
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision
from urllib.request import urlopen
import os

#configurações:

# config desenho
PENCIL_THICKNESS = 16
PENCIL_COLOR = (0, 0, 255)  # BGR format: Pure Bright Red
CANVAS_BLEND_RATIO = 0.35  # Canvas blending strength - lower = brighter camera

# config detecção
HAND_DETECTION_MASK_RADIUS = 30  # Radius around hand to create mask (suavização)
HAND_MASK_BLUR_STRENGTH = 25  # Gaussian blur for smooth mask transitions

# config res/camera
FLIP_CAMERA = True  # Flip camera horizontally
DISPLAY_WIDTH = 1024
DISPLAY_HEIGHT = 768

# ============================================================================
# MODEL LOADING
# ============================================================================

MODEL_PATH = 'hand_landmarker.task'
if not os.path.exists(MODEL_PATH):
    print("Downloading hand landmarker model...")
    url = "https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/1/hand_landmarker.task"
    with urlopen(url) as response:
        with open(MODEL_PATH, 'wb') as out_file:
            out_file.write(response.read())
    print("Model downloaded!")

# ============================================================================
# UTILITY FUNCTIONS
# ============================================================================

def create_hand_mask(canvas_shape, hand_landmarks, mask_radius=HAND_DETECTION_MASK_RADIUS):
    """
    Create a mask that excludes the hand region for cleaner drawings.
    This prevents the hand itself from covering the drawn strokes.
    """
    mask = np.ones(canvas_shape, dtype=np.uint8) * 255
    
    # Create circles around each hand landmark to exclude hand region
    for landmark in hand_landmarks:
        cv2.circle(mask, landmark, mask_radius, 0, -1)
    
    # Apply Gaussian blur to soften mask transitions for smooth detection
    mask = cv2.GaussianBlur(mask, (HAND_MASK_BLUR_STRENGTH, HAND_MASK_BLUR_STRENGTH), 0)
    
    return mask


def is_index_extended_up(landmarks):
    """
    Check if index finger is extended upward and separated from other fingers.
    Uses proportional thresholds to handle perspective changes when hand moves.
    Returns True only when index tip is significantly above the middle finger tip.
    
    Landmarks:
    - 8: index finger tip
    - 12: middle finger tip
    - 5: index finger base (MCP)
    - 9: middle finger base (MCP)
    - 0: wrist
    """
    try:
        wrist = np.array(landmarks[0])
        index_tip = np.array(landmarks[8])
        middle_tip = np.array(landmarks[12])
        index_base = np.array(landmarks[5])
        middle_base = np.array(landmarks[9])
        
        # Calculate hand size (wrist to middle base distance) for proportional checks
        hand_size = np.linalg.norm(middle_base - wrist)
        
        # Index should be extended (length relative to hand size)
        index_length = np.linalg.norm(index_tip - index_base)
        index_well_extended = index_length > hand_size * 0.5  # More lenient threshold
        
        # Main condition: index tip must be above middle tip
        # Using Y coordinate difference (less than -20 pixels means index is above)
        index_above_middle = (index_tip[1] - middle_tip[1]) < -15  # Lenient threshold
        
        # Middle should not be as extended as index
        middle_length = np.linalg.norm(middle_tip - middle_base)
        index_more_extended = index_length > middle_length * 0.7  # Index at least 70% of middle
        
        return index_above_middle and index_well_extended and index_more_extended
    
    except:
        return False

# ============================================================================
# MAIN DRAWING APPLICATION
# ============================================================================

def main():
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        print("Error: Could not open camera.")
        return

    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    print(f"Camera: {width}x{height}")

    # Display preview size (scaled for faster display)
    display_width = DISPLAY_WIDTH
    display_height = DISPLAY_HEIGHT

    # Smoothing settings (masking effect to keep landmarks stable)
    prev_landmarks = None
    lost_frames = 0
    max_lost_frames = 5
    smoothing_alpha = 0.7  # larger = less lag, smaller = smoother
    
    # Drawing settings
    canvas = np.zeros((height, width, 3), dtype=np.uint8)
    drawing_points = []
    pencil_thickness = PENCIL_THICKNESS
    pencil_color = PENCIL_COLOR
    was_drawing = False  # Track previous drawing state to avoid connecting strokes

    # Initialize hand landmarker
    base_options = python.BaseOptions(model_asset_path=MODEL_PATH)
    options = vision.HandLandmarkerOptions(base_options=base_options, num_hands=2)
    detector = vision.HandLandmarker.create_from_options(options)

    scale_x = width / display_width
    scale_y = height / display_height
    
    # Hand connections for drawing
    HAND_CONNECTIONS = [
        (0, 1), (1, 2), (2, 3), (3, 4),                     # thumb
        (0, 5), (5, 6), (6, 7), (7, 8),                     # index finger
        (0, 9), (9, 10), (10, 11), (11, 12),               # middle finger
        (0, 13), (13, 14), (14, 15), (15, 16),             # ring finger
        (0, 17), (17, 18), (18, 19), (19, 20)              # pinky
    ]

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        # Flip camera horizontally for intuitive drawing
        if FLIP_CAMERA:
            frame = cv2.flip(frame, 1)

        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=rgb)
        results = detector.detect(mp_image)

        if results.hand_landmarks:
            lost_frames = 0
            hand_landmarks = results.hand_landmarks[0]

            current_landmarks = []
            for lm in hand_landmarks:
                current_landmarks.append((int(lm.x * width), int(lm.y * height)))

            if prev_landmarks is None or len(prev_landmarks) != len(current_landmarks):
                smoothed_landmarks = current_landmarks
            else:
                smoothed_landmarks = [
                    (
                        int(smoothing_alpha * cur[0] + (1 - smoothing_alpha) * prev[0]),
                        int(smoothing_alpha * cur[1] + (1 - smoothing_alpha) * prev[1]),
                    )
                    for cur, prev in zip(current_landmarks, prev_landmarks)
                ]

            prev_landmarks = smoothed_landmarks
            
            # Check if index finger is properly extended upward
            is_drawing = is_index_extended_up(smoothed_landmarks)
            
            if is_drawing:
                index_tip = smoothed_landmarks[8]
                drawing_points.append(index_tip)
                if len(drawing_points) > 2000:  # Limit points to avoid memory issues
                    drawing_points.pop(0)
                was_drawing = True
            else:
                # Stop drawing - save current stroke permanently before clearing
                if was_drawing and len(drawing_points) > 1:
                    # Draw accumulated points to permanent canvas
                    for i in range(len(drawing_points) - 1):
                        cv2.line(canvas,
                                drawing_points[i],
                                drawing_points[i + 1],
                                pencil_color,
                                pencil_thickness)
                    drawing_points = []  # Clear temp points to prevent line between strokes
                was_drawing = False
        else:
            lost_frames += 1
            if lost_frames > max_lost_frames:
                prev_landmarks = None
                # NOTE: Canvas is NEVER erased here - drawings stay forever until eraser tool

        display_frame = cv2.resize(frame, (display_width, display_height))
        display_canvas = cv2.resize(canvas, (display_width, display_height))
        
        # Draw on the resized canvas
        if len(drawing_points) > 1:
            display_drawing_points = [
                (int(x / scale_x), int(y / scale_y)) for x, y in drawing_points
            ]
            for i in range(len(display_drawing_points) - 1):
                cv2.line(display_canvas, 
                        display_drawing_points[i], 
                        display_drawing_points[i + 1],
                        pencil_color, 
                        pencil_thickness)
        
        # Apply hand mask to hide hand region for cleaner drawing
        if prev_landmarks is not None:
            display_hand_landmarks = [
                (int(x / scale_x), int(y / scale_y)) for x, y in prev_landmarks
            ]
            hand_mask = create_hand_mask(
                (display_canvas.shape[0], display_canvas.shape[1]), 
                display_hand_landmarks, 
                mask_radius=HAND_DETECTION_MASK_RADIUS
            )
            # Apply mask to canvas (normalize mask to 0-1 range)
            hand_mask_normalized = hand_mask.astype(float) / 255.0
            for i in range(3):
                display_canvas[:, :, i] = (display_canvas[:, :, i] * hand_mask_normalized).astype(np.uint8)
        
        # Blend canvas with frame - stronger camera visibility
        alpha = CANVAS_BLEND_RATIO
        display_frame = cv2.addWeighted(display_frame, (1 - alpha), display_canvas, alpha, 0)

        if prev_landmarks is not None:
            display_points = [
                (int(x / scale_x), int(y / scale_y)) for x, y in prev_landmarks
            ]

            for start_idx, end_idx in HAND_CONNECTIONS:
                cv2.line(
                    display_frame,
                    display_points[start_idx],
                    display_points[end_idx],
                    (0, 255, 0),
                    2,
                )

            for pt in display_points:
                cv2.circle(display_frame, pt, 4, (0, 0, 255), -1)
            
            # Highlight index finger tip with a circle
            cv2.circle(display_frame, display_points[8], 8, (255, 0, 0), 2)

        # Add instructions
        cv2.putText(display_frame, "Index up to draw | C to clear | Q to quit", (10, 30),
                   cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2)

        cv2.imshow("Camera", display_frame)
        key = cv2.waitKey(1) & 0xFF
        if key == ord("q"):
            break
        elif key == ord("c"):
            # Clear the canvas
            canvas = np.zeros((height, width, 3), dtype=np.uint8)
            drawing_points = []
            print("Canvas cleared!")

    cap.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
