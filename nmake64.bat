:: https://github.com/sqlite/sqlite/blob/master/doc/compile-for-windows.md
@echo off
if /I NOT "%1" == "/ENV" setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
rem echo on
if /I "%1" == "/ENV" goto EOF


:: https://www.sqlite.org/compile.html#recommended_compile_time_options
set RECOMMENDED=^
-DSQLITE_DQS=0 ^
-DSQLITE_DEFAULT_MEMSTATUS=0 ^
-DSQLITE_DEFAULT_WAL_SYNCHRONOUS=1 ^
-DSQLITE_LIKE_DOESNT_MATCH_BLOBS ^
-DSQLITE_MAX_EXPR_DEPTH=0 ^
-DSQLITE_OMIT_DEPRECATED ^
-DSQLITE_OMIT_PROGRESS_CALLBACK ^
-DSQLITE_OMIT_SHARED_CACHE ^
-DSQLITE_USE_ALLOCA ^
-DSQLITE_STRICT_SUBTYPE=1

set CUSTOM=^
-DSQLITE_DEFAULT_FOREIGN_KEYS=1 ^
-DSQLITE_ENABLE_NULL_TRIM ^
-DSQLITE_TEMP_STORE=3 ^
-DSQLITE_OMIT_GET_TABLE ^
-DSQLITE_OMIT_TRACE ^
-DSQLITE_ENABLE_JSON1 ^
-DSQLITE_OMIT_TCL_VARIABLE
rem -DSQLITE_OMIT_AUTHORIZATION

set NMAKE_OPTS=^
FOR_WIN10=1 ^
USE_ICU=1 ^
USE_ZLIB=1 ^
USE_CRT_DLL=1 ^
USE_TCLSH_IN_PATH=1 ^
STATICALLY_LINK_TCL=1 ^
SESSION=0 ^
OPTIMIZATIONS=2 ^
SYMBOLS=0


pushd "%~dp0"

rd /S /Q build
rd /S /Q bin
rd /S /Q exe
rd /S /Q include
rd /S /Q lib
rd /S /Q tools

mkdir bin
mkdir include
mkdir lib
mkdir tools

mkdir build
pushd build

rem nmake /f ..\src\Makefile.msc TOP=..\src %NMAKE_OPTS% "OPTIONS=%RECOMMENDED% %CUSTOM%" moreclean
nmake /f ..\src\Makefile.msc TOP=..\src %NMAKE_OPTS% "OPTIONS=%RECOMMENDED% %CUSTOM%" core
nmake /f ..\src\Makefile.msc TOP=..\src %NMAKE_OPTS% "OPTIONS=%RECOMMENDED% %CUSTOM%" sqlite3.def

copy /y winsqlite3.dll %~dp0bin
copy /y winsqlite3.lib %~dp0lib
copy /y sqlite3.def %~dp0include
copy /y *.h %~dp0include

copy /y winsqlite3shell.exe %~dp0exe

set DUMPBIN_DIR=%~dp0nmake-dump-release-%platform%
mkdir %DUMPBIN_DIR%
dumpbin /all sqlite3.lo > %DUMPBIN_DIR%\sqlite3.lo.all.txt
dumpbin /headers winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.headers.txt
dumpbin /exports winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.exports.txt
dumpbin /dependents winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.dependents.txt
dumpbin /imports winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.imports.txt

nmake /f ..\src\Makefile.msc TOP=..\src sqldiff.exe
nmake /f ..\src\Makefile.msc TOP=..\src sqlite3_rsync.exe
nmake /f ..\src\Makefile.msc TOP=..\src sqlite3_analyzer.exe

copy /y sqldiff.exe %~dp0tools
copy /y sqlite3_rsync.exe %~dp0tools
copy /y sqlite3_analyzer.exe %~dp0tools

nmake /f ..\src\Makefile.msc TOP=..\src sqlite3_expert.exe
nmake /f ..\src\Makefile.msc TOP=..\src sqlite3_checker.exe
nmake /f ..\src\Makefile.msc TOP=..\src dbdump.exe
nmake /f ..\src\Makefile.msc TOP=..\src showdb.exe
nmake /f ..\src\Makefile.msc TOP=..\src dbtotxt.exe
nmake /f ..\src\Makefile.msc TOP=..\src index_usage.exe
nmake /f ..\src\Makefile.msc TOP=..\src fts3view.exe
nmake /f ..\src\Makefile.msc TOP=..\src showjournal.exe

copy /y sqlite3_expert.exe %~dp0tools
copy /y sqlite3_checker.exe %~dp0tools
copy /y dbdump.exe %~dp0tools
copy /y showdb.exe %~dp0tools
copy /y dbtotxt.exe %~dp0tools
copy /y index_usage.exe %~dp0tools
copy /y fts3view.exe %~dp0tools
copy /y showjournal.exe %~dp0tools



popd
popd


endlocal

:EOF
