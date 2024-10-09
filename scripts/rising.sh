rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/RisingTechOSS/android -b fourteen -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/aosp-realm/android_build_manifest.git -b apollo-rising14 .repo/local_manifests && \
/opt/crave/resync.sh && \
export BUILD_RISING=true
source build/envsetup.sh && \
riseup apollo user && \
rise b > /dev/null && \
mv out/target/product/apollo/RisingOS*.zip . && \
export WITH_GMS=true && \
export TARGET_DEFAULT_PIXEL_LAUNCHER=true && \
rise b > /dev/null && \
mv out/target/product/apollo/RisingOS*.zip . && \
export TARGET_CORE_GMS=true && \
export TARGET_CORE_GMS_EXTRAS=true && \
rise b > /dev/null && \
mv out/target/product/apollo/RisingOS*.zip .
