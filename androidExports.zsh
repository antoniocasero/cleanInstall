# Android
if [ `uname` = "Darwin" ] ; then
    export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
    # AOSP want's JDK 1.7.x, make sure we use that:
    jdk8_ver=$(ls /Library/Java/JavaVirtualMachines/ | grep "1.8" | tail -n 1)
    export ANDROID_JAVA_HOME=/Library/Java/JavaVirtualMachines/$jdk8_ver/Contents/Home/
else
    export ANDROID_SDK_ROOT=$HOME/.android/sdk
    case "$(grep -e "^ID=" /etc/os-release | cut -d"=" -f2)" in
        'fedora')
            export JAVA_HOME=/usr/lib/jvm/java
            ;;
        'opensuse')
            export JAVA_HOME=/usr/lib64/jvm/jre
            ;;
        'ubuntu'|*)
            export JAVA_HOME=$(dirname $(dirname $(update-alternatives --list javac)))
            ;;
    esac
fi

ANDROID_BUILD_TOOLS_VERSION=$(ls $ANDROID_SDK_ROOT/build-tools | tail -n1)

export PATH=$ANDROID_SDK_ROOT/emulator:$PATH
export NDK_ROOT=$ANDROID_SDK_ROOT/ndk-bundle
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/tools/proguard/bin:$ANDROID_SDK_ROOT/build-tools/$ANDROID_BUILD_TOOLS_VERSION:$NDK_ROOT:$PATH
export ANDROID_HVPROTO=ddm                  # Hierarchy viewer variable