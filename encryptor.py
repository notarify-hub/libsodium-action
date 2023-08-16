from base64 import b64encode
from nacl import encoding, public
import sys

def encrypt(public_key: str, secret_value: str) -> str:
  """Encrypt a Unicode string using the public key."""
  public_key = public.PublicKey(public_key.encode("utf-8"), encoding.Base64Encoder())
  sealed_box = public.SealedBox(public_key)
  encrypted = sealed_box.encrypt(secret_value.encode("utf-8"))
  return b64encode(encrypted).decode("utf-8")

public_key = sys.argv[1]
secret_raw = sys.argv[2]

print(encrypt(public_key, secret_raw));
