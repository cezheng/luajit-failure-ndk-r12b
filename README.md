# Android NDK linker failure with luajit demo

This repo is to show how Android NDK r12b's linker error issue when luajit is present, when using clang toolchain & c++_static STL.

## Run
Clone this project and just run: 

```bash
$ ndk-build
```

You shall see error message like this:

```
[armeabi-v7a] Gdbserver      : [arm-linux-androideabi] libs/armeabi-v7a/gdbserver
[armeabi-v7a] Gdbsetup       : libs/armeabi-v7a/gdb.setup
[armeabi-v7a] Compile++ thumb: hello-jni <= hello-jni.cpp
[armeabi-v7a] SharedLibrary  : libhello-jni.so
/path/to/android-ndk-r12b/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/../../../../arm-linux-androideabi/bin/ld: error: /path/to/android-ndk-r12b/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a(pr-support.o): multiple definition of '_Unwind_GetRegionStart'
/path/to/android-ndk-r12b/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/../../../../arm-linux-androideabi/bin/ld: /path/to/android-ndk-r12b/sources/cxx-stl/llvm-libc++abi/../llvm-libc++/libs/armeabi-v7a/libunwind.a(Unwind-EHABI.o): previous definition here
/path/to/android-ndk-r12b/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/../../../../arm-linux-androideabi/bin/ld: error: /path/to/android-ndk-r12b/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a(pr-support.o): multiple definition of '_Unwind_GetLanguageSpecificData'
/path/to/android-ndk-r12b/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/../../../../arm-linux-androideabi/bin/ld: /path/to/android-ndk-r12b/sources/cxx-stl/llvm-libc++abi/../llvm-libc++/libs/armeabi-v7a/libunwind.a(Unwind-EHABI.o): previous definition here
clang++: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [obj/local/armeabi-v7a/libhello-jni.so] Error 1
```

## Other information
* This demo is based on [hello-jni](https://github.com/googlesamples/android-ndk/tree/android-mk/hello-jni).
* luajit's binary is taken from [cocos2d-x's 3rd party binary repo](https://github.com/cocos2d/cocos2d-x-3rd-party-libs-bin/tree/v3/lua/luajit/prebuilt/android/armeabi-v7a). Build info can be found [here](https://github.com/cocos2d/cocos2d-x-3rd-party-libs-src/blob/v3/contrib/src/luajit/rules.mak), version is 2.0.1 as of Aug. 4th, 2016.
* [A possibly related issue](https://code.google.com/p/android/issues/detail?id=73907) reported in 2014.
* This demo cannot be built with NDK r10e either. But if we add `LIBCXX_USE_GABIXX := true` in Application.mk, then NDK r10e stops complaining about linker issue. However, this does not work with r12b.

