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
target_link_libraries(distortosTemplateSubfolder PRIVATE
		distortos::distortos)
distortosTargetLinkerScripts(distortosTemplateSubfolder $ENV{DISTORTOS_LINKER_SCRIPT})

include(${CMAKE_CURRENT_LIST_DIR}/folderWithFunctions/distortosTemplateSubfolder-sources.cmake)

distortosBin(distortosTemplateSubfolder distortosTemplateSubfolder.bin)
distortosDmp(distortosTemplateSubfolder distortosTemplateSubfolder.dmp)
distortosHex(distortosTemplateSubfolder distortosTemplateSubfolder.hex)
distortosLss(distortosTemplateSubfolder distortosTemplateSubfolder.lss)
distortosMap(distortosTemplateSubfolder distortosTemplateSubfolder.map)
distortosSize(distortosTemplateSubfolder)
