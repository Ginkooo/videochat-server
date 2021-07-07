option(WARNINGS_AS_ERRORS
    "Treat compiler warning as errors"
    TRUE)

set(CLANG_WARNINGS -Wall
                   -Wextra
                   -Wpedantic
                   -Wshadow
                   -Wnon-virtual-dtor
                   -Wold-style-cast
                   -Wcast-align
                   -Wunused
                   -Woverloaded-virtual
                   -Wsign-conversion
                   -Wnull-dereference
                   -Wdouble-promotion
                   -Wformat=2
                   -Wno-c99-extensions
                   -Wno-deprecated-volatile
)

if(WARNINGS_AS_ERRORS)
    set(CLANG_WARNINGS ${CLANG_WARNINGS} -Werror)
endif()

set(GCC_WARNINGS ${CLANG_WARNINGS}
                 -Wmisleading-indentation
                 -Wduplicated-cond
                 -Wduplicated-branches
                 -Wlogical-op
                 -Wuseless-cast
)

if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    set(PROJECT_WARNINGS ${CLANG_WARNINGS})
else()
    set(PROJECT_WARNINGS ${GCC_WARNINGS})
endif()

target_compile_options(common_project_options INTERFACE ${PROJECT_WARNINGS})
