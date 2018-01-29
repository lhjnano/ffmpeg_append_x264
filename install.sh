echo DOWNLOAd X264
git clone https://github.com/qupai/x264.git

echo BUILD X264
cp x264_build_android.sh ./x264/
cd ./x264
./x264_build_android.sh

echo BUILD FFMPEG
cd ..
./build_android.sh

cp Android.mk android/arm

@echo Complete install x264
