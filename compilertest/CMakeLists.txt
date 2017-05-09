cmake_minimum_required(VERSION 3.7)
project(compilertest)

set(CMAKE_CXX_STANDARD 14)
set(SOURCE_FILES main.cpp ../cmake/LibClangDiagnosticsChecker.cpp)
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/../cmake)
include(FindPkgConfig)
find_package(CompilerLib REQUIRED)
include_directories(${COMPILERLIB_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} ${COMPILERLIB_LIBRARY})
