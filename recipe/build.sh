# Special bullet build for ISIS3. 
# The 0001-max-num-parts-in-bits.patch is necessary for ISIS applications
# that use bullet for calculations on few but large bodies.

mkdir bullet-build
cd bullet-build

cmake .. -G "Unix Makefiles" -DBUILD_PYBULLET=OFF \
	                     -DBUILD_SHARED_LIBS=ON \
                             -DBUILD_PYBULLET_NUMPY=OFF \
                             -DUSE_DOUBLE_PRECISION=ON \
                             -DCMAKE_BUILD_TYPE=Release \
                             -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
                             -DCMAKE_INSTALL_PREFIX=${PREFIX} \
                             -DBUILD_UNIT_TESTS=OFF\
                             -DCMAKE_INSTALL_RPATH=${PREFIX}

make -j ${CPU_COUNT}  || exit 1
make install
