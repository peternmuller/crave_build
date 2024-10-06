rm -rf .repo/local_manifests ; \
repo init --depth=1 --no-repo-verify -u https://github.com/StatiXOS/android_manifest.git -b vic -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/peternmuller/android_build_manifest.git -b apollo-statix .repo/local_manifests && \
/opt/crave/resync.sh && \
sed -i '/struct sigaction {/,/};/d' hardware/qcom-caf/sm8250/kernel-headers/asm-generic/signal.h && \
source build/envsetup.sh && \
brunch statix_apollo-ap2a-user > /dev/null
