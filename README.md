distortosTemplateSubfolder [![Build Status](https://travis-ci.org/DISTORTEC/distortosTemplateSubfolder.svg?branch=master)](https://travis-ci.org/DISTORTEC/distortosTemplateSubfolder)
==========================

Project template for [distortos](http://distortos.org/) - an advanced real-time operating system for deeply embedded
targets.

In this template *distortos* is located in a subfolder of the project. This subfolder can be a git submodule or an
extracted source package. Such structure may look like this:

    .
    ├── applicationFolder1/
    │   ├── someFile1.cpp
    │   ...
    ├── applicationFolder2/
    │   ├── someFile2.cpp
    │   ...
    ├── distortos/           <-- subfolder with distortos
    │   ├── ...
    │   ├── include/
    │   ├── scripts/
    │   ├── source/
    │   ├── ...
    │   ...
    ├── someOtherFolder/
    │   ├── otherFile.cpp
    │   ...
    ├── ...
    ├── main.cpp
    ├── Makefile
    ├── Rules.mk
    ├── topFile1.cpp
    ├── topFile2.cpp
    ├── ...
    ├── Tupfile.lua
    ├── Tuprules.lua
    └── ...

Subfolder with distortos can have any name and can be located anywhere in your project - this can be configured in
top-level `Makefile` or `Tuprules.lua` of this template with `DISTORTOS_PATH` variable.

Configuration & building
------------------------

1. Download this template - either download and extract it from source package or clone its repository;
2. Add sources of *distortos* somewhere in the template - either download and extract it from source package, clone its
repository or configure it as a git submodule;
3. Configure path to sources of *distortos* in `DISTORTOS_PATH` variable in top-level `Makefile` (if you use
*GNU Make*) or `Tuprules.lua` (if you use *tup*); You can skip this step if this path is `distortos/`, as this is
the default value;
4. Configure distortos - you can either create new configuration (with `make menuconfig`) or use and existing one;
5. Execute `make configure CONFIG_PATH=<path-to-distortosConfiguration.mk>` to select the configuration you
created/chose above;
6. Execute `make` (if you use *GNU Make*) or `tup` (if you use *tup*);

#### Quick example

Following commands may be executed in POSIX-compatible shell (e.g. *Bash*) to build latest project template with latest
*distortos*, using one of existing configurations.

    $ wget https://github.com/DISTORTEC/distortosTemplateSubfolder/archive/master.zip -O distortosTemplateSubfolder-master.zip
    $ unzip -q distortosTemplateSubfolder-master.zip
    $ wget https://github.com/DISTORTEC/distortos/archive/master.zip -O distortos-master.zip
    $ unzip -q distortos-master.zip -d distortosTemplateSubfolder-master
    $ cd distortosTemplateSubfolder-master
    $ mv distortos-master/ distortos/
    $ make configure CONFIG_PATH=distortos/configurations/STM32F4DISCOVERY/test
    $ make
