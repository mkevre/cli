#!/bin/bash
set -e

ARCH="386"

if [[ $EXECUTABLE_PATH =~ "amd64" ]]; then
  ARCH="amd64"
fi

OUT_PATH=gh_signed-${ARCH}.exe

osslsigncode sign \
  -certs certificate.pem \
  -key private-key.pem \
  -n "GitHub CLI" \
  -t http://timestamp.digicert.com \
  -in $EXECUTABLE_PATH \
  -out $OUT_PATH

mv $OUT_PATH $EXECUTABLE_PATH