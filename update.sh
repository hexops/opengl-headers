#!/usr/bin/env bash
set -euo pipefail
set -x

OPENGL_REV=22ffb40aef5203367ad9a1431cabbba30d0230b9
EGL_REV=b055c9b483e70ecd57b3cf7204db21f5a06f9ffe
MESA_REV=4baea976bb585013124b91dc4e9aef793f36605a

# `git clone --depth 1` but at a specific revision
git_clone_rev() {
    repo=$1
    rev=$2
    dir=$3

    rm -rf "$dir"
    mkdir "$dir"
    pushd "$dir"
    git init -q
    git fetch "$repo" "$rev" --depth 1
    git checkout -q FETCH_HEAD
    popd
}

rm -rf GL GLES GLES2 GLES3 GLSC2 EGL KHR

git_clone_rev https://github.com/KhronosGroup/OpenGL-Registry.git "$OPENGL_REV" _opengl
mv _opengl/api/{GL,GLES,GLES2,GLES3,GLSC2} .
rm -rf GLES/1.0 # this directory contains headers for GLES 1.0 that we can't support
rm -rf _opengl

git_clone_rev https://github.com/KhronosGroup/EGL-Registry.git "$EGL_REV" _egl
mv _egl/api/{EGL,KHR} .
rm -rf _egl

git_clone_rev https://gitlab.freedesktop.org/mesa/mesa.git "$MESA_REV" _mesa
mv _mesa/include/GL/{gl,glx}.h GL
rm -rf _mesa
