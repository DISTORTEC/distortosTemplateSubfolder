distortosTemplateSubfolder [![Build Status](https://travis-ci.org/DISTORTEC/distortosTemplateSubfolder.svg?branch=master)](https://travis-ci.org/DISTORTEC/distortosTemplateSubfolder)
==========================

Project template for [distortos](http://distortos.org/) - an advanced real-time operating system for deeply embedded
targets.

In this template *distortos* is located in a subfolder of the project. This subfolder can be a git submodule (as in this
repository) or an extracted source package. Such structure may look like this:

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

Subfolder with *distortos* can have any name and can be located anywhere in your project - this can be configured in
top-level `Makefile` or `Tuprules.lua` of this template with `DISTORTOS_PATH` variable.

Configuration & building
------------------------

1. Download
[source package of this template](https://github.com/DISTORTEC/distortosTemplateSubfolder/archive/master.zip) and
extract it;
2. Download [source package of distortos](https://github.com/DISTORTEC/distortos/archive/master.zip) and extract it
somewhere inside the template;
3. Configure path to sources of *distortos* in `DISTORTOS_PATH` variable in top-level `Makefile` (if you use
*GNU Make*) or `Tuprules.lua` (if you use *tup*); You can skip this step if this path is `distortos/`, as this is
the default value;
4. Configure distortos - you can either create new configuration (with `make menuconfig`) or use an existing one;
5. Execute `make configure CONFIG_PATH=<path-to-distortosConfiguration.mk>` to select the configuration you
created/chose above;
6. Execute `make` (if you use *GNU Make*) or `tup` (if you use *tup*);

Alternatively you can replace steps 1 and 2 with just
`git clone --recursive https://github.com/DISTORTEC/distortosTemplateSubfolder`. In such scenario you can also
skip step 3. To update *distortos* submodule to latest version use `git submodule update --remote` command.

If you downloaded versioned source package from [distortos.org](http://distortos.org/), then you may skip first three
steps - releases already contain sources of *distortos* in default path.

### Quick example

Following commands may be executed in POSIX-compatible shell (e.g. *Bash*).

#### 1. Download

Download and extract latest project template with latest *distortos*:

    $ wget https://github.com/DISTORTEC/distortosTemplateSubfolder/archive/master.zip -O distortosTemplateSubfolder-master.zip
    $ unzip -q distortosTemplateSubfolder-master.zip
    $ wget https://github.com/DISTORTEC/distortos/archive/master.zip -O distortos-master.zip
    $ unzip -q distortos-master.zip -d distortosTemplateSubfolder-master
    $ cd distortosTemplateSubfolder-master
    $ mv -T distortos-master/ distortos/

or clone the repository:

    $ git clone --recursive https://github.com/DISTORTEC/distortosTemplateSubfolder
    $ cd distortosTemplateSubfolder

or download and extract latest released project template:

    $ wget http://distortos.org/files/distortosTemplateSubfolder-20160503.tar.xz
    $ tar -xf distortosTemplateSubfolder-20160503.tar.xz
    $ cd distortosTemplateSubfolder-20160503

#### 2. Configure

Either use one of existing configurations:

    $ make configure CONFIG_PATH=distortos/configurations/STM32F4DISCOVERY/test

or create a new one from scratch:

    $ make menuconfig
    ... edit some options, save the configuration as distortosConfiguration.mk ...
    $ make configure

#### 3. Build

Build the project with *make*:

    $ make

or do the same with *tup*:

    $ tup

#### 4. Edit configuration & rebuild

To edit any option in the selected configuration just run *kconfig* tool again:

    $ make menuconfig
    ... edit some options, overwrite configuration file ...

You can rebuild the project immediatelly by running *make*:

    $ make

or *tup*:

    $ tup
