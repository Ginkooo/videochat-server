cmake_minimum_required(VERSION 3.10)

add_executable(VideochatServer)

target_sources(
    VideochatServer
    PRIVATE
        main.cpp
)

target_link_libraries(
    VideochatServer
    PRIVATE
        sockpp
        pthread
)

