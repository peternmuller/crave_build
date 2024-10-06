rm -rf .repo/local_manifests && \
repo init --depth=1 --no-repo-verify -u https://github.com/AOSPA/manifest -b uvite -g default,-mips,-darwin,-notdefault && \
git clone https://github.com/peternmuller/android_build_manifest.git -b apollo-aospa14 .repo/local_manifests && \
/opt/crave/resync.sh && \
./rom-build.sh apollo
