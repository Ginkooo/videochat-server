add_executable(VideochatServer)

target_sources(
    VideochatServer
    PRIVATE
        main.cpp
)

target_link_libraries(
    VideochatServer
    PRIVATE
        pthread
        common_project_options
)

target_link_libraries_system(
    VideochatServer
    PRIVATE
        sockpp
)
