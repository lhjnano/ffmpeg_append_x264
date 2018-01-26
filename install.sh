echo DOWNLOAd X264
git clone git://git.videolan.org/x264.git

echo BUILD X264
cp x264_build_android.sh ./x264/
cd ./x264
./x264_build_android.sh

echo BUILD FFMPEG
cd ..
./build_android.sh

@echo Complete install x264
