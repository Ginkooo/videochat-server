cmake_minimum_required(VERSION 3.16)

project(VideochatServer VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/build/bin)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

add_library(common_project_options INTERFACE)
include(CommonProjectOptions)
include(CompileWarnings)
include(TargetLinkLibrariesSystem)

add_subdirectory(external)
add_subdirectory(src)
