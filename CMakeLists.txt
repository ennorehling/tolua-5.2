# Copyright (C) 2007-2014 LuaDist.
# Created by Peter Drahoš
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( tolua C )
cmake_minimum_required ( VERSION 2.8 )
include ( cmake/dist.cmake )

find_package ( Lua REQUIRED )
include_directories ( include src/lib ${LUA_INCLUDE_DIR} )

file ( GLOB SRC_LIBTOLUA src/lib/*.c )

add_library ( tolua_lib SHARED ${SRC_LIBTOLUA} )
target_link_libraries ( tolua_lib ${LUA_LIBRARIES} )
set_target_properties ( tolua_lib PROPERTIES OUTPUT_NAME tolua
	CLEAN_DIRECT_OUTPUT 1 )
if ( WIN32 )
  target_compile_definitions (tolua_lib PRIVATE TOLUA5_DLL)
endif ()

# Build app
include_directories ( src/bin )
set ( SRC_TOLUA src/bin/tolua.c src/bin/toluabind.c )
add_executable ( tolua ${SRC_TOLUA} )
target_link_libraries ( tolua tolua_lib ${LUA_LIBRARIES} )

# Install
install_library ( tolua_lib )
install_executable ( tolua )
install_header ( include/ )
install_data ( README INSTALL )
