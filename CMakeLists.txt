#
# file: CMakeLists.txt
#
# author: Copyright (C) 2018 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

cmake_minimum_required(VERSION 3.1)
project(distortosTemplateSubfolder)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/distortos/cmake)
include(distortos-utilities)

#-----------------------------------------------------------------------------------------------------------------------
# distortos library
#-----------------------------------------------------------------------------------------------------------------------

add_subdirectory(distortos)

#-----------------------------------------------------------------------------------------------------------------------
# distortosTemplateSubfolder application
#-----------------------------------------------------------------------------------------------------------------------

add_executable(distortosTemplateSubfolder.elf
		main.cpp)
set_target_properties(distortosTemplateSubfolder.elf PROPERTIES
		CXX_STANDARD 11
		CXX_STANDARD_REQUIRED ON)
target_link_libraries(distortosTemplateSubfolder.elf
		distortos::distortos
		-Xlinker -Map="${CMAKE_CURRENT_BINARY_DIR}/distortosTemplateSubfolder.map")

include(${CMAKE_CURRENT_LIST_DIR}/folderWithFunctions/distortosTemplateSubfolder.elf-sources.cmake)

bin(distortosTemplateSubfolder.elf distortosTemplateSubfolder.bin)
dmp(distortosTemplateSubfolder.elf distortosTemplateSubfolder.dmp)
hex(distortosTemplateSubfolder.elf distortosTemplateSubfolder.hex)
lss(distortosTemplateSubfolder.elf distortosTemplateSubfolder.lss)
size(distortosTemplateSubfolder.elf)
