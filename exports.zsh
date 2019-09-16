export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export CCACHE_BASEDIR="/Users/antoniocasero/Documents/sparta"
export CCACHE_MEMCACHED_CONF="--SERVER=apigen-memcached.ad.here.com"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/lib/ccache:$PATH"
export OPENSSL_ROOT_DIR=/usr/local/Cellar/openssl/1.0.2m

##CMAKE
export PATH="/Applications/CMake.app/Contents/bin":"$PATH"