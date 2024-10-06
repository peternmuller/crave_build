rm -rf .repo/local_manifests && \
repo init --depth=1 --no-repo-verify -u https://github.com/AOSPA/manifest -b uvite -g default,-mips,-darwin,-notdefault && \
/opt/crave/resync.sh && \
./rom-build.sh apollo
