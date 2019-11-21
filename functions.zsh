# Xcode via @orta
function openx(){
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return
    else
      echo "Nothing found"
    fi
  fi
}

function lines() {
   local find="find . '(' -name '*.m' -or -name '*.mm' -or -name '*.cpp' -or -name '*.swift' ')' -not -path './$1/*' -print0 | xargs -0 wc -l | sort"
   echo $find
   sh -c $find;
}

function opengit() {
    open $1 -a /Applications/Sourcetree.app
}

function creategitreview() {
    touch .gitreview
    echo "[gerrit]
    host=gerrit.it.here.com
    port=29418
    project=$1
    defaultbranch=master
    defaultremote=origin
    defaultrebase=0" > .gitreview
}

function venv() {
  echo "Starting venv"
  python3 -m venv ./venv
  source ./venv/bin/activate
}

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

function navi-generate() {
  cmake -GXcode -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=\"ON\" \
  -DCMAKE_CXX_COMPILER="$(find_clang++)" \
  -DCMAKE_C_COMPILER="$(find_clang)" \
  -DCMAKE_USE_CCACHE=1 \
  -DOPENSSL_INCLUDE_DIR=/usr/local/Cellar/openssl/1.0.2t/include \
  -DOPENSSL_CRYPTO_LIBRARY=/usr/local/Cellar/openssl/1.0.2t/lib/libcrypto.dylib \
  -DOPENSSL_SSL_LIBRARY=/usr/local/Cellar/openssl/1.0.2t/lib/libssl.dylib \
  -DCMAKE_OSX_ARCHITECTURES=x86_64 \
  -Wno-dev \
  ..
}
