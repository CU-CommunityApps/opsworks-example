#!/bin/bash
# Simple script to encrypt secrets using a KMS key.
# Does a full round-trip to convince you that the secret was encrypted properly.

# The IAM user or role you use to run this script must have privleges to use the desginated key for encryption/decryption.

# You can use cloudformation/50-kms-key.json template to create a KMS key.
KEY='add key ID here'

aws kms encrypt --key-id $KEY --plaintext fileb://data.plaintext --output text --query CiphertextBlob  > data.base64.encrypted

cat data.base64.encrypted | base64 --decode > data.encrypted

aws kms decrypt --ciphertext-blob fileb://data.encrypted --output text --query Plaintext | base64 --decode > data.rt.plaintext
