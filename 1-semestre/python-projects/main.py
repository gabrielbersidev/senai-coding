from smartcard.System import readers
from smartcard.util import toHexString
import time

r = readers()

if not r:
    print("❌ Nenhum leitor encontrado.")
    exit()

# normalmente o contactless é o segundo da lista
reader = None
for rd in r:
    if "Contactless" in str(rd):
        reader = rd
        break

if reader is None:
    print("❌ Nenhum leitor contactless encontrado.")
    exit()

print("📡 Usando leitor:", reader)
print("⏳ Aproxime o cartão..")

while True:
    try:
        connection = reader.createConnection()
        connection.connect()

        atr = connection.getATR()
        print("\n🎉 Cartão detectado!")
        print("ATR:", toHexString(atr))

        time.sleep(3)

    except:
        pass