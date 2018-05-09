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

include(distortos-utilities)

#-----------------------------------------------------------------------------------------------------------------------
# distortos library
#-----------------------------------------------------------------------------------------------------------------------

add_subdirectory(distortos)

#-----------------------------------------------------------------------------------------------------------------------
# distortosTemplateSubfolder application
#-----------------------------------------------------------------------------------------------------------------------

add_executable(distortosTemplateSubfolder
		main.cpp)
set_target_properties(distortosTemplateSubfolder PROPERTIES
		CXX_STANDARD 11
		CXX_STANDARD_REQUIRED ON)
target_link_libraries(distortosTemplateSubfolder
		distortos::distortos
		distortos::allCxxFlags
		-Xlinker -Map="${CMAKE_CURRENT_BINARY_DIR}/distortosTemplateSubfolder.map")

include(${CMAKE_CURRENT_LIST_DIR}/folderWithFunctions/distortosTemplateSubfolder-sources.cmake)

bin(distortosTemplateSubfolder distortosTemplateSubfolder.bin)
dmp(distortosTemplateSubfolder distortosTemplateSubfolder.dmp)
hex(distortosTemplateSubfolder distortosTemplateSubfolder.hex)
lss(distortosTemplateSubfolder distortosTemplateSubfolder.lss)
size(distortosTemplateSubfolder)
