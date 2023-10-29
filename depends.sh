d=recovery/root
echo '########working on:'
echo $d
read
strings $d/system/bin/* $d/system/lib64/* $d/vendor/bin/* $d/vendor/bin/hw/* $d/vendor/lib64/* $d/vendor/lib64/hw/* | grep bin/ | sort | uniq > bin
strings $d/system/bin/* $d/system/lib64/* $d/vendor/bin/* $d/vendor/bin/hw/* $d/vendor/lib64/* $d/vendor/lib64/hw/* | grep "^[^ \t].*\.so$" | sort | uniq > so

echo '########depends:'
cat bin
grep -Fxvf whitelist so

echo '########shares:'
grep -Fxf whitelist so

echo '########gets:'
c=$(comm -13 whitelist so)
rm gets
for f in $c; do g=$(find $d -type f -name "$f"); [ -n "$g" ] && echo "$g" || echo "########missing $f"; done | tee -a gets

cat << EOF > README.md
# Android device tree for vivo V2054A (PD2054)

\`\`\`
#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
\`\`\`

\`\`\`
$(cat props_platform.txt)
\`\`\`

\`\`\`
$(tree)
\`\`\`
EOF
