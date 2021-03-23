#!/bin/sh

mkdir build && cd build

cmake .. \
  -GNinja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DBUILD_SHARED_LIBS=ON \
  -DINSTALL_LIBS=ON \
  -DINSTALL_EXTRA_LIBS=ON \
  -DBUILD_PYBULLET=ON \
  -DBUILD_PYBULLET_NUMPY=ON \
  -DBUILD_OPENGL3_DEMOS=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SKIP_RPATH=YES

ninja install

install -Dm755 examples/ExampleBrowser/App_ExampleBrowser $PREFIX/bin/BulletExampleBrowser
mkdir -p $PREFIX/opt/bullet
cp -r data $PREFIX/opt/bullet/