cmake_minimum_required(VERSION 2.8)
project(logger)

include_directories(
    include
    ${ROOT_DIR}/include/rs/core
)

set(LOGGER_DIR ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(log_utils)


# Logging will be enabled only if log4cxx is installed on your system

if(BUILD_LOGGER)
    MESSAGE("Building logger. Note: Logging will be enabled only if log4cxx is installed on your system")
    add_subdirectory(logger)
else()
    MESSAGE("Building without logger")
endif(BUILD_LOGGER)


