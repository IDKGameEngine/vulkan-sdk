cmake_minimum_required(VERSION 3.31)

project(vulkan-unpack)
include(GNUInstallDirs)

# Execute the shell script during CMake configuration
execute_process(
    COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/unpack.sh"
    RESULT_VARIABLE SCRIPT_RETURN_CODE
    OUTPUT_VARIABLE SCRIPT_OUTPUT
    ERROR_VARIABLE SCRIPT_ERROR
)

# Optional: Print the script's output to the CMake console
message(STATUS "Script Output: ${SCRIPT_OUTPUT}")

# Optional: Handle script errors gracefully
# if(NOT SCRIPT_RETURN_CODE EQUAL 0)
#     message(FATAL_ERROR "Script failed with error: ${SCRIPT_ERROR}")
# endif()

set(SDK_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/sdk/x86_64")
install(DIRECTORY "${SDK_PREFIX}/bin/"     DESTINATION "${CMAKE_INSTALL_BINDIR}")
install(DIRECTORY "${SDK_PREFIX}/include/" DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")
install(DIRECTORY "${SDK_PREFIX}/lib/"     DESTINATION "${CMAKE_INSTALL_LIBDIR}")
