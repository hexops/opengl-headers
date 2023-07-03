#!/usr/bin/env bash
set -euo pipefail
set -x

rm -rf GL/ GLES/ GLES2/ GLES3/ GLSC/ GLSC2/
rm -rf _registry
git clone https://github.com/KhronosGroup/OpenGL-Registry --depth 1 _registry
mv _registry/api/GL .
mv _registry/api/GLES .
mv _registry/api/GLES2 .
mv _registry/api/GLES3 .
mv _registry/api/GLSC .
mv _registry/api/GLSC2 .
rm -rf _registry

