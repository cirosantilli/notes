# Build

## Android

Pass flags to the dring android gcc:

    EXTRA_CFLAGS=-DDEBUG_FPS ./compile.sh

and then you need for `DDEBUG_FPS`:

    adb logcat -s libdring

The android build of `dring` stores all build files under `build-android-arm-linux-androideabi`, to try and not interfere with other builds. Great stuff! Unfortunately it does not work properly, and you have to clean everything before rebuilding dring e.g. for GNOME.

TODO how to make a verbose build with all compile commands shown? Editing `Makefile` with `ndk-build V=1` seems to work, better way?
