#
# file: distortosTemplateSubfolder-sources.cmake
#
# author: Copyright (C) 2018 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

target_include_directories(distortosTemplateSubfolder PRIVATE
		${CMAKE_CURRENT_LIST_DIR})
target_sources(distortosTemplateSubfolder PRIVATE
		${CMAKE_CURRENT_LIST_DIR}/functionFromFolder.cpp)

include(${CMAKE_CURRENT_LIST_DIR}/subfolderWithFunctions/distortosTemplateSubfolder-sources.cmake)
