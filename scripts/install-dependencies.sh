#! /bin/sh
UNITY_WGL_URL="https://beta.unity3d.com/download/472613c02cf7/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2017.1.0f3.pkg"

echo 'Installing nvm:'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

echo 'Installing node.js v0.12.18:'
nvm install $NODE_VERSION

echo 'Installing bower:'
npm install -g bower

echo 'Installing ember-cli:'
npm install -g ember-cli

echo 'Installing phantomjs:'
npm install -g phantomjs

if [ -e "Unity_WebGL.pkg" ]; then
    echo "File Unity_WebGL.pkg found in directory"
else
  echo 'Downloading Unity WebGL Target Support pkg:'
  curl --retry 5 -o Unity_WebGL.pkg $UNITY_WGL_URL
  if [ $? -ne 0 ]; then { echo "Download failed"; exit $?; } fi
fi
