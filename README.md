distortosTemplateSubfolder [![Build Status](https://travis-ci.org/DISTORTEC/distortosTemplateSubfolder.svg?branch=master)](https://travis-ci.org/DISTORTEC/distortosTemplateSubfolder)
==========================

Project template for [distortos](http://distortos.org/) - object-oriented C++ RTOS for microcontrollers

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
    ├── CMakeLists.txt
    ├── main.cpp
    ├── topFile1.cpp
    ├── topFile2.cpp
    └── ...

Subfolder with *distortos* can have any name and can be located anywhere in your project - this only affects the
`add_subdirectory(<path-to-distortos>)` in top-level `CMakeLists.txt` of this template.

Configuration & building
------------------------

To configure & build *distortosTemplateSubfolder* you need:
- [CMake](https://cmake.org/) (version 3.7 or later);
- [a build tool supported by CMake](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html#manual:cmake-generators(7)) -
it is highly recommended to use [Ninja](https://ninja-build.org/);
- [arm-none-eabi bleeding-edge-toolchain](https://github.com/FreddieChopin/bleeding-edge-toolchain) (*GCC* version 5 or
later);

Build infrastructure of *distortos* tries to follow typical *CMake* cross-compiling workflow, which means that you
always have to use a so-called *toolchain file*. Toolchain files in *distortos* also serve another purpose - they select
the board which is going to be used by your application.

1. Download source package of *distortosTemplateSubfolder* in
[zip](https://github.com/DISTORTEC/distortosTemplateSubfolder/archive/master.zip) or
[tar.gz](https://github.com/DISTORTEC/distortosTemplateSubfolder/archive/master.tar.gz) format and extract it;
2. Download source package of *distortos* in [zip](https://github.com/DISTORTEC/distortos/archive/master.zip) or
[tar.gz](https://github.com/DISTORTEC/distortos/archive/master.tar.gz) format and extract it inside
*distortosTemplateSubfolder* extracted in step 1, for example to `distortos/`;
3. Adjust relative path to *distortos* in `add_subdirectory(<path-to-distortos>)` from top-level `CMakeLists.txt`;
4. Create a build folder, for example `output`;
5. From within the build folder, initialize it with *CMake*, for example with
`cmake .. -DCMAKE_TOOLCHAIN_FILE=../distortos/source/board/ST_STM32F4DISCOVERY/Toolchain-ST_STM32F4DISCOVERY.cmake -GNinja`
if you want a default configuration or
`DISTORTOS_PATH=distortos cmake -C../distortos/configurations/ST_STM32F4DISCOVERY/test/distortosConfiguration.cmake .. -GNinja`
if you want to start from a saved configuration;
6. Edit *distortos* configuration with a tool of your choice, for example `cmake-gui ..` (a GUI application) or
`ccmake ..` (*curses*-based application);
7. Execute selected build tool, for example `ninja` or `ninja -v` if you want to see all command lines while building;

You can obviously replace steps 1-3 with
`git clone --recursive https://github.com/DISTORTEC/distortosTemplateSubfolder`.

Steps 4-6 can be all done from within `cmake-gui`. After starting the application use *Browse Source...* button to
select the folder with *distortosTemplateSubfolder* and *Browse Build...* button to select the build folder. Then click
on *Configure* button. In the *CMakeSetup* window which appears select the generator of your choice and make sure that
*Specify toolchain file for cross-compiling* is selected before going any further. Click *Next* and specify the
toolchain file (which also selects the board), for example
`<source-folder>/distortos/source/board/ST_STM32F4DISCOVERY/Toolchain-ST_STM32F4DISCOVERY.cmake` and click *Finish*
button.

### tl;dr

    $ wget https://github.com/DISTORTEC/distortosTemplateSubfolder/archive/master.tar.gz -O distortosTemplateSubfolder-master.tar.gz
    $ tar -xf distortosTemplateSubfolder-master.tar.gz
    $ wget https://github.com/DISTORTEC/distortos/archive/master.tar.gz -O distortos-master.tar.gz
    $ tar -xf distortos-master.tar.gz
    $ mv -T distortos-master/ distortosTemplateSubfolder-master/distortos/
    $ cd distortosTemplateSubfolder-master
    $ mkdir output
    $ cd output
    $ cmake .. -DCMAKE_TOOLCHAIN_FILE=../distortos/source/board/ST_STM32F4DISCOVERY/Toolchain-ST_STM32F4DISCOVERY.cmake -GNinja
    $ cmake-gui ..
    $ ninja

or

    $ wget https://github.com/DISTORTEC/distortosTemplateSubfolder/archive/master.tar.gz -O distortosTemplateSubfolder-master.tar.gz
    $ tar -xf distortosTemplateSubfolder-master.tar.gz
    $ wget https://github.com/DISTORTEC/distortos/archive/master.tar.gz -O distortos-master.tar.gz
    $ tar -xf distortos-master.tar.gz
    $ mv -T distortos-master/ distortosTemplateSubfolder-master/distortos/
    $ cd distortosTemplateSubfolder-master
    $ mkdir output
    $ cd output
    $ DISTORTOS_PATH=distortos cmake -C../distortos/configurations/ST_STM32F4DISCOVERY/test/distortosConfiguration.cmake .. -GNinja
    $ cmake-gui ..
    $ ninja
