echo GetV
echo Grabbing V...
git clone https://github.com/vlang/v .gitv
cd .gitv
git pull
echo Building V..
make
echo Setting Up...
cp -r vlib ..
cp -r tools ..
cp -r thirdparty ..
cp -r examples ..
echo Complete! Use ./v to use v, or add $PWD to path to use v anywhere!
