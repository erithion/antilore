mkdir build
cd build 

:: Available flags
::  -DANTILORE_BOOSTROOT - the flag controls the location of Boost library. 
::  -DANTILORE_WITHVLC=1 - use this flag if you want to copy built antilore into the bin folder along with VLC.
::      To unset the flag simply delete it from the parameters.

cmake -DANTILORE_WITHVLC=1 -DANTILORE_BOOSTROOT=C:\ms\boost_1_67_0 ..
