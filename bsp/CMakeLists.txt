add_library(bsp
src/bsp/bsp.cpp)


#target_include_directories(my_math PUBLIC include)
target_include_directories( bsp PUBLIC
$<INSTALL_INTERFACE:include>
$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/include/bsp/bsp.h ${CMAKE_CURRENT_SOURCE_DIR}/src/bsp/bsp.cpp  DESTINATION ${CMAKE_INSTALL_PREFIX}/include/bsp)

install(TARGETS bsp EXPORT my_export DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/bsp)

