rm -rf .repo/local_manifests && \
repo init --depth=1 --no-repo-verify -u https://github.com/AOSPA/manifest -b uvite -g default,-mips,-darwin,-notdefault && \
/opt/crave/resync.sh && \
git clone https://github.com/AOSPA/android_device_xiaomi_apollo.git -b uvite device/xiaomi/apollo && \
git clone https://github.com/ThankYouMario/proprietary_vendor_xiaomi.git -b uvite vendor/xiaomi/apollo && \
git clone https://github.com/AOSPA/android_kernel_xiaomi_sm8250.git -b uvite kernel/xiaomi/sm8250 && \
source build/envsetup.sh && \
lunch aospa_apollo-user && \
make installclean && \
mka bacon
