set(CMAKE_BUILD_TYPE
    RelWithDebInfo
    CACHE STRING "Type of build" FORCE)

target_precompile_headers(common_project_options INTERFACE
                            <string>
                            <vector>)
