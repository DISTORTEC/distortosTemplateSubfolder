Change Log
==========

All notable changes to this project will be documented in this file.

[20190505](https://github.com/DISTORTEC/distortosTemplateSubfolder/compare/v20180701...v20190505) - 2019-05-05
--------------------------------------------------------------------------------------------------------------

### Changed

- Implemended full support for configuring and building with *CMake*. The new *CMake* workflow does not need *Kconfig*
or any shell tools - just *CMake* (version 3.7 or later), build tool (it is recommended to use *Ninja*) and
*arm-none-eabi bleeding-edge-toolchain* (*GCC* version 5 or later). Check `README.md` for more details about usage.

### Removed

- Removed support for configuring with *Kconfig* and building with *make*. Both of these tasks are now handled by
*CMake*.

[20180701](https://github.com/DISTORTEC/distortosTemplateSubfolder/compare/v20170914...v20180701) - 2018-07-01
--------------------------------------------------------------------------------------------------------------

### Added

- *CMake*-based build system. At this moment all configuration is still done with *Kconfig* - *CMake* loads selected
`distortosConfiguration.mk` and only deals with compilation. Typical use case involves following steps: select
configuration with `make configure CONFIG_PATH=...`, create output folder of your choice (`mkdir output`) and enter it
(`cd output`), configure compilation with
`cmake .. -DCMAKE_TOOLCHAIN_FILE=../distortos/cmake/Toolchain-arm-none-eabi.cmake` and finally start the build with
`make`. You can obviously use other
[*CMake* generators](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html), e.g. *Ninja*, *Eclipse CDT4*
project, ... *CMake*-based build system will only support configurations with proper board, i.e. "Custom board" choice
for "Board" in *Kconfig* is not supported.

### Removed

- Removed *tup* build infrastructure - *tup* is no longer supported for building *distortos*.

[20170914](https://github.com/DISTORTEC/distortosTemplateSubfolder/compare/v20170311...v20170914) - 2017-09-14
--------------------------------------------------------------------------------------------------------------

This is just a snapshot with version *0.5.0* of *distortos*.

[20170311](https://github.com/DISTORTEC/distortosTemplateSubfolder/compare/v20161124...v20170311) - 2017-03-11
--------------------------------------------------------------------------------------------------------------

This is just a snapshot with version *0.4.0* of *distortos*.

[20161124](https://github.com/DISTORTEC/distortosTemplateSubfolder/compare/v20160503...v20161124) - 2016-11-24
--------------------------------------------------------------------------------------------------------------

This is just a snapshot with version *0.3.0* of *distortos*.

[20160503](https://github.com/DISTORTEC/distortosTemplateSubfolder/compare/v20160226...v20160503) - 2016-05-03
--------------------------------------------------------------------------------------------------------------

This is just a snapshot with version *0.2.0* of *distortos*.

20160226 - 2016-02-26
---------------------

### Added

- Basic *make* and *tup* build infrastructure.
- Some example sources and headers to demonstrate how the template and build files are supposed to work.
- `README.md` file with some brief explanation and quick examples.
- Integration with [Travis CI](https://travis-ci.org/DISTORTEC/distortosTemplateSubfolder) service.
