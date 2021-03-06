#!/bin/sh
echo GetV
echo By webmsgr
echo This tool is not endorsed by the makers of v
echo
echo Grabbing V...
git clone https://github.com/vlang/v .gitv > /dev/null
cd .gitv
git pull
echo Building V..
make > vbuild.log
if [ $? -ne 0 ]; then
    echo "Error in building v"
    cat vbuild.log
    exit 1
fi
echo Setting Up...
cp -r vlib ..
cp -r tools ..
cp -r thirdparty ..
cp -r examples ..
cp v.v ..
echo testing v
./v -prod -embed_vlib -o ../v v.v > vstep1.log
if [ $? -ne 0 ]; then
    echo "V test failed"
    cat vstep1.log
    exit 1
fi
cd ..
./v -o lossy v.v > vstep2.log
if [ $? -ne 0 ]; then
    echo "V test failed"
    cat vstep2.log
    exit 1
fi
rm lossy
sudo ./v symlink
echo 
echo Complete! Use v to use v!
echo Use this script to update v.
echo
