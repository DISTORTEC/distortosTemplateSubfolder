Change Log
==========

All notable changes to this project will be documented in this file.

[Unreleased](https://github.com/DISTORTEC/distortosTemplateSubfolder/compare/v20170311...HEAD)
----------------------------------------------------------------------------------------------

### Changed

- Updated build files to work correctly with split linker scripts from *distortos*. You have to change one of linked
executable's (`*.elf` file's) dependencies from `LDSCRIPT` to `LDSCRIPTS` if using *make*
([example](https://github.com/DISTORTEC/distortosTemplateSubfolder/commit/1ac98ad60365b3ae9f74f99e7dc559568e9f4fa4#diff-d18b2b232b506ce9d9bc330b7714bb78))
or to `table.unpack(LDSCRIPTS)` if using *tup*
([example](https://github.com/DISTORTEC/distortosTemplateSubfolder/commit/1ac98ad60365b3ae9f74f99e7dc559568e9f4fa4#diff-56a170c35a6d8c05b7c8577ed907329f)).
Another option is to simply add `$(SYMBOLS_LD)` for *make* or `SYMBOLS_LD` for *tup* as dependency of `*.elf`
executable. Without such changes the linking will fail with
``undefined symbol `__main_stack_size' referenced in expression`` error message.

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
