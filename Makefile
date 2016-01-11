#
# file: Makefile
#
# author: Copyright (C) 2016 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

#-----------------------------------------------------------------------------------------------------------------------
# path to distortos subfolder
#-----------------------------------------------------------------------------------------------------------------------

DISTORTOS_PATH := distortos

#-----------------------------------------------------------------------------------------------------------------------
# reuse Makefile from distortos subfolder
#-----------------------------------------------------------------------------------------------------------------------

include $(DISTORTOS_PATH)/Makefile

$(GENERATED): Makefile
