#!/bin/bash

# This script should run in a python virtual environment
PYTHON_INTERPRETER="$(which python)"
echo "Python interpreter used: $PYTHON_INTERPRETER"

SIP_VERSION=4.19.13
SIP=sip-$SIP_VERSION

HERE=$(dirname "$0")

TEMP=$HERE/temp
mkdir -p "$TEMP"
pushd "$TEMP" || exit

mkdir -p downloads

if [[ -e downloads/$SIP.tar.gz ]]; then
    echo SIP version "$SIP_VERSION" already downloaded
else
    echo Download SIP version "$SIP_VERSION"
    curl -L https://downloads.sourceforge.net/project/pyqt/sip/$SIP/$SIP.tar.gz -o downloads/$SIP.tar.gz
fi

echo "Extract SIP files"
tar xvf downloads/$SIP.tar.gz

PY_LIBRARY=word
echo "Configure a private copy of SIP $SIP_VERSION for the python library '$PY_LIBRARY'"

cd $SIP
# See docs:
# http://pyqt.sourceforge.net/Docs/sip4/using.html#building-a-private-copy-of-the-sip-module
python configure.py \
  --sip-module $PY_LIBRARY.sip \
  --no-module
  
echo "Compile SIP source files"
make
echo "Install a private copy of SIP $SIP_VERSION for the python library '$PY_LIBRARY'"
make install

# Double-check that the SIP version we are using is the one we have installed
SIPFILE="$(which sip)"
echo "SIP used: $SIPFILE"
echo "SIP version used $(sip -V)"
echo "SIP version installed $SIP_VERSION"

popd
rm -rf $TEMP
