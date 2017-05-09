cmake_minimum_required(VERSION 3.7)
project(compiler)

set(CMAKE_CXX_STANDARD 14)

set(COMPILERLIB_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/compilerlib)
set(COMPILERLIB_LIBRARY compilerlib)

add_subdirectory(compilerlib)
add_subdirectory(compilercli)
#add_subdirectory(compilertest)

add_dependencies(compilercli compilerlib)
#add_dependencies(compilertest compilerlib)