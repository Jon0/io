project (io)
cmake_minimum_required (VERSION 2.8)

set (Boost_USE_STATIC_LIBS ON) 
set (Boost_MULTITHREADED ON)
set (Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost COMPONENTS system date_time filesystem iostreams REQUIRED)
include_directories( ${Boost_INCLUDE_DIRS} )


file(GLOB SRC_FILES
    "src/*.cpp"
)

add_definitions(-std=c++11)
add_executable (iomain ${SRC_FILES})
target_link_libraries (iomain pthread ${Boost_LIBRARIES})
