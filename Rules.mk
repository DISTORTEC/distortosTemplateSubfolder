#
# file: Rules.mk
#
# author: Copyright (C) 2016 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

#-----------------------------------------------------------------------------------------------------------------------
# subdirectories
#-----------------------------------------------------------------------------------------------------------------------

SUBDIRECTORIES += $(DISTORTOS_PATH:%/=%)
SUBDIRECTORIES += folderWithFunctions

#-----------------------------------------------------------------------------------------------------------------------
# final targets
#-----------------------------------------------------------------------------------------------------------------------

ELF_$(d) := $(OUTPUT)$(d)distortosTemplateSubfolder.elf
HEX_$(d) := $(ELF_$(d):%.elf=%.hex)
BIN_$(d) := $(ELF_$(d):%.elf=%.bin)
DMP_$(d) := $(ELF_$(d):%.elf=%.dmp)
LSS_$(d) := $(ELF_$(d):%.elf=%.lss)

#-----------------------------------------------------------------------------------------------------------------------
# add final targets to list of generated files
#-----------------------------------------------------------------------------------------------------------------------

GENERATED := $(GENERATED) $(ELF_$(d)) $(ELF_$(d):%.elf=%.map) $(HEX_$(d)) $(BIN_$(d)) $(DMP_$(d)) $(LSS_$(d))

#-----------------------------------------------------------------------------------------------------------------------
# compilation flags
#-----------------------------------------------------------------------------------------------------------------------

CXXFLAGS_$(d) := $(CXXFLAGS_$(d)) $(STANDARD_INCLUDES)
CXXFLAGS_$(d) := $(CXXFLAGS_$(d)) -I$(d)folderWithFunctions

#-----------------------------------------------------------------------------------------------------------------------
# standard footer
#-----------------------------------------------------------------------------------------------------------------------

include $(DISTORTOS_PATH)footer.mk

#-----------------------------------------------------------------------------------------------------------------------
# .elf file dependencies - libdistortos.a, all objects from this folder tree (excluding distortos subfolder), linker
# script and this Rules.mk
#-----------------------------------------------------------------------------------------------------------------------

$(ELF_$(d)): $(OUTPUT)libdistortos.a $(OBJECTS_$(d)) $(LDSCRIPT) $(d)Rules.mk
$(ELF_$(d)): $(filter-out $(SUBDIRECTORIES_OBJECTS_$(DISTORTOS_PATH)),$(SUBDIRECTORIES_OBJECTS_$(d)))

#-----------------------------------------------------------------------------------------------------------------------
# .hex, .bin, .dmp and .lss files depend on .elf file and this Rules.mk
#-----------------------------------------------------------------------------------------------------------------------

$(HEX_$(d)): $(ELF_$(d)) $(d)Rules.mk
$(BIN_$(d)): $(ELF_$(d)) $(d)Rules.mk
$(DMP_$(d)): $(ELF_$(d)) $(d)Rules.mk
$(LSS_$(d)): $(ELF_$(d)) $(d)Rules.mk

#-----------------------------------------------------------------------------------------------------------------------
# print size of generated .elf file
#-----------------------------------------------------------------------------------------------------------------------

size: $(ELF_$(d))
all: size
