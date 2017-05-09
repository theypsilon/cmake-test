cmake_minimum_required(VERSION 3.7)
project(${COMPILERLIB_LIBRARY})

set(CMAKE_CXX_STANDARD 14)

include(ExternalProject)

set(LLVM_SRC llvm-src)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}-Wa,-mbig-obj")
set(LLVM_TARGETS_TO_BUILD "X86")

ExternalProject_Add(llvm
    PREFIX ${LLVM_SRC}
    URL http://releases.llvm.org/3.9.1/llvm-3.9.1.src.tar.xz
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_SOURCE_DIR} -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_CXX_FLAGS=${GLIBCXX} -std=${CMAKE_CXX_STANDARD} -DCMAKE_EXPORT_COMPILE_COMMANDS=${CMAKE_EXPORT_COMPILE_COMMANDS} -DLLVM_TARGETS_TO_BUILD=${LLVM_TARGETS_TO_BUILD}
)

ExternalProject_Add(compiler-rt
    DEPENDS llvm
    PREFIX ${LLVM_SRC}/projects/compiler-rt
    URL http://releases.llvm.org/3.9.1/compiler-rt-3.9.1.src.tar.xz
    SOURCE_DIR ${LLVM_SRC}/projects/compiler-rt
    BINARY_DIR ${LLVM_SRC}/projects/compiler-rt
    CMAKE_ARGS -DCMAKE_MODULE_PATH=${LLVM_SRC}/src/LLVM/cmake/modules
)

ExternalProject_Add(clang
    DEPENDS llvm compiler-rt
    PREFIX ${LLVM_SRC}/tools/clang
    URL http://releases.llvm.org/3.9.1/cfe-3.9.1.src.tar.xz
    SOURCE_DIR ${LLVM_SRC}/tools/clang
    BINARY_DIR ${LLVM_SRC}/tools/clang
    CMAKE_ARGS -DCLANG_PATH_TO_LLVM_BUILD=${LLVM_SRC}/src/LLVM-build -DCMAKE_MODULE_PATH=${LLVM_SRC}/src/LLVM/cmake/modules
)


set(SOURCE_FILES compilerlib.cpp compilerlib.h)
add_library(${COMPILERLIB_LIBRARY} ${SOURCE_FILES})

add_dependencies(compilerlib llvm compiler-rt clang)


#target_link_libraries(compilerlib)
