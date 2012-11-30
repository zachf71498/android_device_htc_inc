P.A.C. Man for the Droid Incredible


### Initialize
[Setup Linux/OS X](http://source.android.com/source/initializing.html) - Please note: it must be sun-java-6, not openjdk

### Prepare to download sources
```bash
mkdir ~/PAC
mkdir ~/bin
cd ~/PAC/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo
repo init -u git://github.com/CyanogenMod/android.git -b jellybean
```

### Finish setting up repo
```bash
wget -O .repo/local_manifest.xml https://raw.github.com/zachf714/android_device_htc_inc/jellybean-cm/Manifest/local_manifest.xml
```

### Download the source
```bash
cd ~/PAC
repo sync -j16
```
NOTE: This WILL take a long time.

### Build
Make sure we're in ~/PAC...
```bash
cd ~/PAC

### Make INC pac_inc.mk

Look in other pac makes in /vendor/pac/product

Inc is HDPI

Add pac_inc.mk into AndroidProducts.mk

Pull in the prebuilts, like (currently only self-added GooManager)...
```bash
./vendor/cm/get-prebuilts
```
And build!
```bash
./build-pac.sh inc
```

