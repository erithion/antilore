cmake_minimum_required(VERSION 3.12.0)
include( FetchContent )
set    ( BOOST_ROOT                  ${ANTILORE_BOOSTROOT} )
include( FindBoost )

set    ( PROJECT_NAME                antilore_plugin )
set    ( ANTILORE_SOURCE_DIR         ${CMAKE_CURRENT_SOURCE_DIR}/src/ )
set    ( ANTILORE_BUILD_DIR          ${CMAKE_CURRENT_SOURCE_DIR}/bin/ )
set    ( ANTILORE_DEPEND_DIR         ${CMAKE_CURRENT_SOURCE_DIR}/src/depends/ )
set    ( CMAKE_CXX_FLAGS             "${CMAKE_CXX_FLAGS} /EHc /std:c++latest" )
set    ( CMAKE_SHARED_LINKER_FLAGS   "${CMAKE_SHARED_LINKER_FLAGS} /SAFESEH:NO" )

file   ( GLOB 
         SRC_FILES                   ${ANTILORE_SOURCE_DIR}/*.cpp )
file   ( GLOB 
         INC_FILES                   ${ANTILORE_SOURCE_DIR}/*.h )
         
project( ${PROJECT_NAME} )
message( STATUS "CXX flags ${CMAKE_CXX_FLAGS}" )
message( STATUS "Linker flags ${CMAKE_SHARED_LINKER_FLAGS}" )

# External projects antilore depends on
set                         ( Boost_USE_STATIC_LIBS       ON ) # only find static libs
set                         ( Boost_USE_MULTITHREADED     ON )
set                         ( Boost_USE_STATIC_RUNTIME    OFF )
# find_package                ( Boost 1.67.0 REQUIRED COMPONENTS filesystem locale)

if( "${CMAKE_SIZEOF_VOID_P}" STREQUAL "4" )
    message                     ( STATUS "Fetching VLC 3.0 32bit SDK ..." )
    FetchContent_Declare        ( vlc30
                                  URL http://download.videolan.org/pub/videolan/vlc/3.0.0/win32/vlc-3.0.0-win32.7z
                                  URL_HASH SHA256=ba1bceff15adc5fc3a600b5a793f54c1d72bfc832422de77223b19f97351515d )
else()
    message                     ( STATUS "Fetching VLC 3.0 64bit SDK ..." )
    FetchContent_Declare        ( vlc30
                                  URL http://download.videolan.org/pub/videolan/vlc/3.0.0/win64/vlc-3.0.0-win64.7z
                                  URL_HASH SHA256=3eb580a7aa466acf0d15f70f863baf84883e2908a0b8f8a4bce94652faaf536a )
endif()
FetchContent_GetProperties  ( vlc30 )
if( NOT vlc30_POPULATED )
    FetchContent_Populate   ( vlc30 )
endif()

message( STATUS "Fetching dirent ..." )
FetchContent_Declare        ( dirent
                              GIT_REPOSITORY https://github.com/tronkko/dirent
                              GIT_TAG 1.23.2 )
FetchContent_GetProperties  ( dirent )
if( NOT dirent_POPULATED )
    FetchContent_Populate   ( dirent )
endif()

add_definitions      ( -D_CRT_NONSTDC_NO_DEPRECATE ) # warning C4996: 'strdup': The POSIX name for this item is deprecated. 
add_definitions      ( -DBOOST_CONFIG_SUPPRESS_OUTDATED_MESSAGE )
add_definitions      ( -D_SILENCE_CXX17_ITERATOR_BASE_CLASS_DEPRECATION_WARNING )

include_directories  ( ${ANTILORE_SOURCE_DIR}/
                       ${Boost_INCLUDE_DIRS}
                       ${ANTILORE_DEPEND_DIR}
                       ${vlc30_SOURCE_DIR}/sdk/include/vlc 
                       ${vlc30_SOURCE_DIR}/sdk/include/vlc/plugins
                       ${vlc30_SOURCE_DIR}/sdk/include 
                       ${dirent_SOURCE_DIR}/include )
                       
link_directories     ( ${vlc30_SOURCE_DIR}/sdk/lib 
                       ${Boost_LIBRARY_DIR} )

add_library          ( ${PROJECT_NAME} SHARED 
                       ${SRC_FILES} 
                       ${INC_FILES} 
                       ${ANTILORE_DEPEND_DIR}/poll.cpp )

target_link_libraries( ${PROJECT_NAME} libvlc.lib )
target_link_libraries( ${PROJECT_NAME} libvlccore.lib )
target_link_libraries( ${PROJECT_NAME} Ws2_32.lib )
target_link_libraries( ${PROJECT_NAME} ${Boost_LIBRARIES} )

if( DEFINED ANTILORE_WITHVLC )
    message ( STATUS              "ANTILORE_WITHVLC is ${ANTILORE_WITHVLC}. antilore will be installed along with VLC" )
    set     ( ANTILORE_BUILD_TO   ${ANTILORE_BUILD_DIR}/vlc30 )
    
    install ( DIRECTORY           ${vlc30_SOURCE_DIR}/  
              DESTINATION         ${ANTILORE_BUILD_TO} )
endif()

install( TARGETS        ${PROJECT_NAME}                         
         DESTINATION    ${ANTILORE_BUILD_TO}/plugins/antilore )