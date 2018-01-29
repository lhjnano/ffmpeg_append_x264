NDK=$HOME/Android/Sdk/ndk-bundle
PLATFORM=$NDK/platforms/android-19/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
EXTRA_CFLAGS="-I./android-lib/include" 
EXTRA_LDFLAGS="-L./android-lib/lib "

function build_one
{
./configure \
 --prefix=$PREFIX \
 --enable-shared \
 --disable-static \
 --disable-doc \
 --disable-ffmpeg \
 --disable-ffplay \
 --disable-ffprobe \
 --disable-ffserver \
 --disable-doc \
 --disable-symver \
 --enable-gpl \
 --enable-version3 \
 --enable-libx264 \
 --enable-encoder=libx264 \
 --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
 --target-os=linux \
 --arch=arm \
 --enable-cross-compile \
 --sysroot=$PLATFORM \
 --extra-cflags="-Os -fpic $ADDI_CFLAGS $EXTRA_CFLAGS" \
 --extra-ldflags="$ADDI_LDFLAGS $EXTRA_LDFLAGS" \
 $ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}

CPU=arm
PREFIX=$(pwd)/android/$CPU 
ADDI_CFLAGS="-marm -march=armv7-a -mfloat-abi=softfp -mfpu=neon"
ADDI_LDFLAGS="-Wl,--fix-cortex-a8"
build_one
