APP_ABI := armeabi-v7a
APP_STL := c++_static
APP_CPPFLAGS := -fsigned-char -Wno-extern-c-compat -Wno-sentinel
APP_CXXFLAGS := -frtti -fexceptions -std=c++11
APP_LDFLAGS := -latomic
NDK_TOOLCHAIN_VERSION := clang
APP_PLATFORM := android-14
# Just like r12b, NDK r10e cannot build this project either
# but if you uncomment the following line, then this project can be built with NDK r10e
#LIBCXX_USE_GABIXX := true
