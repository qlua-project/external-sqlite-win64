sqlite amalgamation

https://github.com/sqlite/sqlite?tab=readme-ov-file#the-amalgamation

SQLite runs about 5% faster when compiled from the amalgamation versus when compiled from individual source files.
Combining all individual source code files into a single big source code file allows the C compiler to perform more cross-procedure analysis and generate better code.

The amalgamation source file is more than 200K lines long. Some symbolic debuggers (most notably MSVC) are unable to deal with files longer than 64K lines.
Tcl script, tool/split-sqlite3c.tcl, break it up into a single small C file called sqlite3-all.c that does #include on about seven other files named sqlite3-1.c, sqlite3-2.c, ..., sqlite3-7.c.


Compilation Notes

It is recommended, but not required, that the build directory be separate from the source directory.
Cd into the build directory and then run the configure script found at the root of the source tree.
Then run "make".

    tar xzf sqlite.tar.gz         ;#  Unpack the source tree into "sqlite"
    mkdir bld                     ;#  Build will occur in a sibling directory
    cd bld                        ;#  Change to the build directory
    ../sqlite/configure           ;#  Run the configure script

    ../sqlite/configure --enable-all --enable-debug CFLAGS='-O0 -g'   ;# Debug build
    ../sqlite/configure --enable-all                                  ;# Release build


https://github.com/sqlite/sqlite?tab=readme-ov-file#compiling-for-windows-using-msvc

set TCLDIR=c:\Tcl  - let SQLite know the location of your TCL library
                     (if you want to run tests)
SQLite itself does not contain any TCL code, but it does use TCL to help with the build process

    nmake /f Makefile.msc sqlite3.exe
    nmake /f Makefile.msc sqlite3.c
    nmake /f Makefile.msc sqldiff.exe
    # Makefile targets below this point require TCL development libraries
    nmake /f Makefile.msc tclextension-install
    nmake /f Makefile.msc devtest
    nmake /f Makefile.msc releasetest
    nmake /f Makefile.msc sqlite3_analyzer.exe

    nmake /f Makefile.msc OPTIONS=-DSQLITE_OMIT_DEPRECATED sqlite3.exe


canonical

https://github.com/sqlite/sqlite/blob/master/doc/compile-for-windows.md

  (Optional)
  As of 2024-10-25, TCL is not longer required for many common build targets, such as "sqlite3.c" or the "sqlite3.exe" command-line tool. 

    nmake /f makefile.vc INSTALLDIR=c:\Tcl release
    nmake /f makefile.vc INSTALLDIR=c:\Tcl install

   `nmake /f makefile.msc`
   `nmake /f makefile.msc sqlite3.c`
   `nmake /f makefile.msc sqlite3.exe`
   `nmake /f makefile.msc sqldiff.exe`
   `nmake /f makefile.msc sqlite3_rsync.exe`

   `nmake /f makefile.msc tclextension-install`
   `nmake /f makefile.msc devtest`
   `nmake /f makefile.msc releasetest`
   `nmake /f makefile.msc sqlite3_analyzer.exe`

   `nmake /f makefile.msc DEBUG=3 clean sqlite3.exe`

    nmake /f Makefile.msc sqlite3.dll USE_NATIVE_LIBPATHS=1 "OPTS=
        -DSQLITE_ENABLE_FTS3=1
        -DSQLITE_ENABLE_FTS4=1
        -DSQLITE_ENABLE_FTS5=1
        -DSQLITE_ENABLE_RTREE=1
        -DSQLITE_ENABLE_JSON1=1
        -DSQLITE_ENABLE_GEOPOLY=1
        -DSQLITE_ENABLE_SESSION=1
        -DSQLITE_ENABLE_PREUPDATE_HOOK=1
        -DSQLITE_ENABLE_SERIALIZE=1
        -DSQLITE_ENABLE_MATH_FUNCTIONS=1"

    nmake /f Makefile.msc STATICALLY_LINK_TCL=1 sqlite3_analyzer.exe

    dumpbin /dependents sqlite3_analyzer.exe


https://www.sqlite.org/compile.html#_options_to_omit_features

Telling your compiler to optimize for size usually has a much larger impact on library footprint than employing any of these compile-time options.

You should also verify that debugging options are disabled.

Some options must also be defined when using the Lemon parser generator tool to generate the parse.c file.
Because of this, such options may only be used when the library is built from canonical source, not from the amalgamation.

In general, always compile from canonical sources in order to take advantage of SQLITE_OMIT_* options.

The SQLITE_OMIT_* options are unsupported. By this we mean that an SQLITE_OMIT_* option that omits code from the build in the current release might become a no-op in the next release. Also, not all SQLITE_OMIT_* options are tested. Some SQLITE_OMIT_* options might cause SQLite to malfunction and/or provide incorrect answers.

   >>> Important Note: The SQLITE_OMIT_* compile-time options are mostly unsupported.


reference

https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options-listed-by-category
https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options-listed-alphabetically

https://learn.microsoft.com/en-us/cpp/build/reference/link-pass-options-to-linker
https://learn.microsoft.com/en-us/cpp/build/reference/linker-options

https://learn.microsoft.com/en-us/cpp/build/reference/c-cpp-build-tools

https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/compiler-options

