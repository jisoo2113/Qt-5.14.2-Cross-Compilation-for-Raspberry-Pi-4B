
#### History
* Update 2022. 04. 18
# Qt 5.14.2 Cross Compilation for Raspberry Pi 4B
## Development Environment
* Host : Windows 10  VM VirturalBox Ubuntu : 20.04.4 LTS (version 확인 CLI : lsb_release -a), VNC Viewer
* Target : Raspberry Pi 4 B Raspbian GNU/Linux buster legacy ver, VNC Server
* Common : SSH enable, Screensaver disable, check ip, wifi or ethernet set


## Step by step
 ** 1. Target(RaspberryPi4B) **
```
sudo vi /etc/apt/sources.list //리스트를 수정해야 함 #deb-src #<-주석제거
apt update
apt full-upgrade
sudo reboot
sudo rpi-update
sudo reboot
```
ls /opt/vc/lib/  에서 libGLESv2.so 파일 존재여부 확인
cat /boot/ .firmware_revision
sudo rpi-update .......... (5,6 번은 펌웨어 버전업데이트 할때만 사용한다.)

sudo vi /etc/apt/sources.list 리스트를 수정해야 함 #deb-src #<-주석제거)
```
sudo apt-get build-dep qt5-qmake (build-dep 의존성 패키지를 가져오려면 
```
```
sudo apt-get build-dep libqt5webengine-data
```
```
sudo apt-get install libboost-all-dev libudev-dev libinput-dev libts-dev libmtdev-dev libjpeg-dev libfontconfig1-dev
```
```
sudo apt-get install libssl-dev libdbus-1-dev libglib2.0-dev libxkbcommon-dev libegl1-mesa-dev libgbm-dev libgles2-mesa-dev mesa-common-dev
```
```
sudo apt-get install libasound2-dev libpulse-dev gstreamer1.0-omx libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-alsa
```
```
sudo apt-get install libvpx-dev libsrtp0-dev libsrtp0-dev libsnappy-dev libnss3-dev 
```
```
sudo apt-get install "^libxcb.*"
```
```
sudo apt-get install libfreetype6-dev libicu-dev libsqlite3-dev libxslt1-dev libavcodec-dev libavformat-dev libswscale-dev
```
```
sudo apt-get install libgstreamer1.0-dev gstreamer1.0-tools libraspberrypi-dev libx11-dev libglib2.0-dev
```
```
sudo apt-get install freetds-dev libsqlite0-dev libpq-dev libiodbc2-dev firebird-dev libjpeg9-dev libgst-dev libxext-dev libxcb1 libxcb1-dev libx11-xcb1
```
```
sudo apt-get install libxcb-sync1 libxcb-sync-dev libxcb-render-util0 libxcb-render-util0-dev libxcb-xfixes0-dev libxrender-dev libxcb-shape0-dev libxcb-randr0-dev
```
```
sudo apt-get install libxcb-glx0-dev libxi-dev libdrm-dev libssl-dev libxcb-xinerama0 libxcb-xinerama0-dev
```
```
sudo apt-get install libatspi-dev libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libfontconfig1-dev
```
```
sudo apt-get install libxss-dev libxtst-dev libpci-dev libcap-dev libsrtp0-dev libxrandr-dev libnss3-dev libdirectfb-dev libaudio-dev
```

권한설정(chown)
```
sudo mkdir /usr/local/qt5pi
sudo chown pi:pi /usr/local/qt5pi/
ls -l /usr/local/qt5pi/
ls -l /usr/local/
```

 ** 2. Host(Ubuntu 20.04.4 LTS on Virtual Box ) **
```
sudo apt-get update
sudo apt-get upgrade
```
ping ip... (raspberrypi ping test)

사용자계정에 맞게 권한등록
```
sudo bash
apt-get install gcc git bison python gperf pkg-config
apt install libclang-dev
mkdir /opt/qt5pi/
chown yoo:yoo /opt/qt5pi/
cd /opt/qt5pi/
```

링크복사 후 wget
```
https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
```
압축해제
```
tar xf gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz 
```
내용 복사 붙여넣기 export PATH=$PATH:/opt/qt5pi//gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin
```
export PATH=$PATH:/opt/qt5pi//gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin
nano ~/.bashrc 
```
qt 웹사이트 링크 복사
```
https://download.qt.io/archive/qt/5.14/5.14.2/single/qt-everywhere-src-5.14.2.tar.xz
```
```
tar xf qt-everywhere-src-5.14.2.tar.xz
```
```
mkdir sysroot
mkdir sysroot/lib
mkdir sysroot/usr
mkdir sysroot/usr/lib
mkdir sysroot/usr/include
mkdir opt
```
폴더 경로가 중요하니 유심히 체크, Target board IP 확인
```
rsync -avz pi@192.168.35.101:/lib/ sysroot/lib
rsync -avz pi@192.168.35.101:/usr/include/ sysroot/usr/include
rsync -avz pi@192.168.35.101:/usr/lib/ sysroot/usr/lib
rsync -avz pi@192.168.35.101:/opt/vc sysroot/opt
```

```
mv sysroot/usr/lib/arm-linux-gnueabihf/libEGL.so.1.1.0 sysroot/usr/lib/arm-linux-gnueabihf/libEGL.so.1.1.0_backup
mv sysroot/usr/lib/arm-linux-gnueabihf/libGLESv2.so.2.1.0 sysroot/usr/lib/arm-linux-gnueabihf/libGLESv2.so.2.1.0_backup
```
```
ln -s sysroot/opt/vc/lib/libEGL.so sysroot/usr/lib/arm-linux-gnueabihf/libEGL.so.1.1.0
ln -s sysroot/opt/vc/lib/libGLESv2.so sysroot/usr/lib/arm-linux-gnueabihf/libGLESv2.so.2.1.0
ln -s sysroot/opt/vc/lib/libEGL.so sysroot/opt/vc/lib/libEGL.so.1
ln -s sysroot/opt/vc/lib/libGLESv2.so sysroot/opt/vc/lib/libGLESv2.so.2
```
```
wget https://raw.githubusercontent.com/riscv/riscv-poky/master/scripts/sysroot-relativelinks.py
chmod +x sysroot-relativelinks.py
./sysroot-relativelinks.py sysroot
```
```
rsync -avz pi@192.168.35.101:/lib/ sysroot/lib
./sysroot-relativelinks.py sysroot
```
```
mkdir qt5build
cd qt5build
```
Configure option check
```
../qt-everywhere-src-5.14.2/configure -opengl es2 -device linux-rasp-pi4-v3d-g++ -device-option CROSS_COMPILE=/opt/qt5pi/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- -sysroot /opt/qt5pi/sysroot -prefix /usr/local/qt5pi -opensource -confirm-license -skip qtscript -skip qtwayland -skip qtdatavis3d -nomake examples -make libs -pkg-config -no-use-gold-linker -v
```
코어갯수 확인 option -j8
```
make -j4
```
'''
make install
'''