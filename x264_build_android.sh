NDK=$HOME/Android/Sdk/ndk-bundle
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
PLATFORM=$NDK/platforms/android-19/arch-arm
PREFIX=../android-lib

find ./ -name "configure" -exec sed -i 's/libx264.so.$API/libx264-$API.so/g' {} \;

./configure \
    --prefix=$PREFIX \
    --enable-static \
    --enable-shared \
    --enable-pic \
    --disable-asm \
    --host=arm-linux \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --sysroot=$PLATFORM

make clean
make -j8
make install
