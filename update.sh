#!/bin/bash
set -x
export PATH="/usr/local/bin:/usr/bin:/bin:/opt/bin:/c/Windows/System32:/c/Windows:/c/Windows/System32/Wbem:/c/Windows/System32/WindowsPowerShell/v1.0/:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/toolchain/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin:/opt/FriendlyARM/toolschain/4.4.3/bin:/c/Users/jimmy/AppData/Roaming/npm:/c/Program Files/nodejs"
root=/e/hexo
page=embnet.github.io

rsync -aP --size-only --delete ./ $root/source/_posts/

cd $root
rm $root/public/* -rf
hexo clean
hexo generate
rsync -aP --size-only $root/source/_posts/* $root/public/
#hexo server

rsync -aP --size-only --delete $root/public/ $root/$page/  --cvs-exclude --exclude=$root/$page/.git

mkdir $root/$page/config
rsync -aP $root/source/_posts/update.sh $root/$page/config/
rsync -aP $root/.gitignore $root/$page/config/
rsync -aP $root/package.json $root/$page/config/
rsync -aP $root/package-lock.json $root/$page/config/
rsync -aP $root/_config.yml $root/$page/config/
rsync -aP $root/themes/material-x $root/$page/config/

cd $root/$page/
tar -cvf config.tar config
rm config -rf

git pull
git add -A
git commit -m "1.自动更新"
git push
