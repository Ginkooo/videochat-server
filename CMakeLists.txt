cmake_minimum_required(VERSION 3.10)

project(VideochatServer)

add_executable(VideochatServer src/main.cpp)

add_subdirectory(external/sockpp)
target_link_libraries(VideochatServer sockpp)
target_link_libraries(VideochatServer pthread)

