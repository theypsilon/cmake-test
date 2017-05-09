cmake_minimum_required(VERSION 3.7)
project(compilercli)

set(CMAKE_CXX_STANDARD 14)
set(SOURCE_FILES main.cpp)
add_executable(${PROJECT_NAME} ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} ${COMPILERLIB_LIBRARY})
include_directories(${COMPILERLIB_INCLUDE_DIR})
