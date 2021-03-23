setlocal enableextensions

mkdir build
cd build
if errorlevel 1 exit 1

cmake .. ^
  -GNinja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -DBUILD_SHARED_LIBS=ON ^
  -DINSTALL_LIBS=ON ^
  -DINSTALL_EXTRA_LIBS=ON ^
  -DBUILD_PYBULLET=ON ^
  -DBUILD_PYBULLET_NUMPY=ON ^
  -DBUILD_OPENGL3_DEMOS=ON ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_SKIP_RPATH=YES ^
  -DPYTHON_EXECUTABLE=%PYTHON% ^
  -DPYTHON_LIBRARY=%PREFIX%/libs/python%CONDA_PY%.lib ^
  -DPYTHON_VERSION_PYBULLET=%PY_VER% ^
  -DPYTHON_SITE_PACKAGES=%SP_DIR%

if errorlevel 1 exit 1

ninja install

if errorlevel 1 exit 1

copy examples\ExampleBrowser\App_ExampleBrowser %PREFIX%\Library\bin\BulletExampleBrowser
if errorlevel 1 exit 1

mkdir %LIBRARY_PREFIX%\opt\bullet
if errorlevel 1 exit 1
xcopy /s data %LIBRARY_PREFIX%\opt\bullet
if errorlevel 1 exit 1