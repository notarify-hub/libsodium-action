#!/bin/sh -l

PUBLIC_KEY=$1
SECRET=$2
OUTPUT=$(python3 encryptor.py $PUBLIC_KEY $SECRET)

echo "$OUTPUT" >> "$GITHUB_OUTPUT"
