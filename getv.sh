#!/bin/sh
echo GetV
echo Grabbing V...
git clone https://github.com/vlang/v .gitv
cd .gitv
git pull
echo Building V..
make
if [ $? -ne 0 ]; then
    echo "Error in building v"
    exit 1
fi
echo Setting Up...
cp -r vlib ..
cp -r tools ..
cp -r thirdparty ..
cp -r examples ..
cp v.v ..
echo testing v
./v -prod -obf -o ../v v.v > /dev/null
if [ $? -ne 0 ]; then
    echo "V test failed"
    exit 1
fi
cd ..
./v -o lossy v.v > /dev/null
if [ $? -ne 0 ]; then
    echo "V test failed"
    exit 1
fi
rm lossy
echo 
echo Complete! Use ./v to use v, or add $PWD to path to use v anywhere!
echo Use this script to update v.
echo
