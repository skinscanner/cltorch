INCLUDE(ExternalProject)

message("CMAKE_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX}")
ExternalProject_Add(
    DeepCL-external
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/DeepCL
    PREFIX ${CMAKE_BINARY_DIR}/DeepCL
    CMAKE_CACHE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo
    -DLIBPNGPP_AVAILABLE:BOOL=OFF
    -DLIBJPEG_AVAILABLE:BOOL=OFF
    -DBUILD_LUA_WRAPPERS:BOOL=OFF
    )

ADD_LIBRARY(DeepCL SHARED IMPORTED)
ADD_LIBRARY(EasyCL SHARED IMPORTED)
ADD_DEPENDENCIES(DeepCL DeepCL-external)
SET(DEEPCL_INCLUDE_DIRS ${CMAKE_INSTALL_PREFIX}/include/deepcl ${CMAKE_INSTALL_PREFIX}/include/easycl )
SET(DEEPCL_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}DeepCL${CMAKE_SHARED_LIBRARY_SUFFIX} ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}EasyCL${CMAKE_SHARED_LIBRARY_SUFFIX})
#SET(DEEPCL_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}EasyCL${CMAKE_SHARED_LIBRARY_SUFFIX})
SET(DEEPCL_FOUND ON)

