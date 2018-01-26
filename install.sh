echo DOWNLOAd X264
git clone git://git.videolan.org/x264.git

echo BUILD X264
cp x264_build_android.sh ./x264/
./x264/x264_build_android.sh

echo BUILD FFMPEG
./build_android.sh
