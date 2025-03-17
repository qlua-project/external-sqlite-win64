:: https://github.com/sqlite/sqlite/blob/master/doc/compile-for-windows.md
@echo off
if /I NOT "%1" == "/ENV" setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
rem echo on
if /I "%1" == "/ENV" goto EOF

:: https://www.sqlite.org/compile.html#recommended_compile_time_options
set __RECOMMENDED=^
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
rem -DSQLITE_THREADSAFE=0 ^
rem -DSQLITE_OMIT_AUTOINIT ^
rem -DSQLITE_OMIT_DECLTYPE
set __STANDARD=^
-DSQLITE_ENABLE_FTS3=1 ^
-DSQLITE_ENABLE_FTS5=1 ^
-DSQLITE_ENABLE_RTREE=1 ^
-DSQLITE_ENABLE_GEOPOLY=1 ^
-DSQLITE_ENABLE_STMTVTAB=1 ^
-DSQLITE_ENABLE_DBPAGE_VTAB=1 ^
-DSQLITE_ENABLE_DBSTAT_VTAB=1 ^
-DSQLITE_ENABLE_BYTECODE_VTAB=1
set __OPTIONAL=^
-DSQLITE_ENABLE_COLUMN_METADATA=1
set __EXTENDED_WIN10=^
-DSQLITE_SYSTEM_MALLOC=1 ^
-DSQLITE_OMIT_LOCALTIME=1
rem -DSQLITE_ENABLE_FTS4=1 ^
set __ALWAYS_WIN10=^
-DSQLITE_ENABLE_MATH_FUNCTIONS=1 ^
-DSQLITE_THREADSAFE=1 ^
-DSQLITE_THREAD_OVERRIDE_LOCK=-1 ^
-DSQLITE_ENABLE_API_ARMOR=1
set __REQUEIRED_WIN10=^
-DSQLITE_MAX_TRIGGER_DEPTH=100
set __EXTRA_SHELL_DEFAULT=^
-DSQLITE_DQS=0 ^
-DSQLITE_ENABLE_FTS4=1 ^
-DSQLITE_ENABLE_EXPLAIN_COMMENTS=1 ^
-DSQLITE_ENABLE_OFFSET_SQL_FUNC=1 ^
-DSQLITE_ENABLE_UNKNOWN_SQL_FUNCTION=1 ^
-DSQLITE_ENABLE_STMT_SCANSTATUS=1 ^
-DSQLITE_STRICT_SUBTYPE=1
set __EXTRA_SHELL=
rem -DSQLITE_MEMDEBUG
rem -DSQLITE_DEBUG
rem -DSQLITE_ENABLE_EXPLAIN_COMMENTS
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set __MY=^
-DSQLITE_DEFAULT_FOREIGN_KEYS=1 ^
-DSQLITE_ENABLE_NULL_TRIM ^
-DSQLITE_TEMP_STORE=3 ^
-DSQLITE_OMIT_EXPLAIN ^
-DSQLITE_OMIT_GET_TABLE ^
-DSQLITE_OMIT_UTF16 ^
-DSQLITE_OMIT_LOAD_EXTENSION ^
-DSQLITE_OMIT_COMPLETE ^
-DSQLITE_OMIT_AUTHORIZATION ^
-DSQLITE_OMIT_TRACE ^
-DSQLITE_OMIT_BUILTIN_TEST ^
-DSQLITE_UNTESTABLE
set __MY_SHELL=^
-DSQLITE_DEFAULT_FOREIGN_KEYS=1 ^
-DSQLITE_ENABLE_NULL_TRIM ^
-DSQLITE_TEMP_STORE=3 ^
-DSQLITE_OMIT_GET_TABLE ^
-DSQLITE_OMIT_UTF16
set __EXTENSIONS=^
-DSQLITE_ENABLE_FTS5 ^
-DSQLITE_ENABLE_FTS4 ^
-DSQLITE_ENABLE_FTS3
set __FEATURES=^
-DSQLITE_ENABLE_SESSION=1 -DSQLITE_ENABLE_PREUPDATE_HOOK=1
set __USEROPTS=^
-DSQLITE_OMIT_LOCALTIME ^
-DSQLITE_SYSTEM_MALLOC ^
-DSQLITE_ENABLE_MATH_FUNCTIONS ^
-DSQLITE_ENABLE_JSON1 ^
-DSQLITE_OMIT_COMPILEOPTION_DIAGS ^
-DSQLITE_OMIT_CASE_SENSITIVE_LIKE_PRAGMA ^
-DSQLITE_OMIT_CAST ^
-DSQLITE_OMIT_DESERIALIZE ^
-DSQLITE_OMIT_AUTORE6SET ^
-DSQLITE_OMIT_AUTOINCREMENT ^
-DSQLITE_OMIT_AUTOVACUUM
rem -DSQLITE_OMIT_ALTERTABLE
rem -DSQLITE_OMIT_VIRTUALTABLE
rem -DSQLITE_OMIT_VACUUM
rem -DSQLITE_OMIT_ANALYZE
rem -DSQLITE_OMIT_REINDEX
rem -DSQLITE_ENABLE_SESSION -DSQLITE_ENABLE_PREUPDATE_HOOK
rem -DSQLITE_ENABLE_SNAPSHOT
rem -DSQLITE_ENABLE_RTREE
rem -DSQLITE_ENABLE_GEOPOLY
rem -DSQLITE_ENABLE_DESERIALIZE
rem -DSQLITE_ENABLE_STAT4

set __OPTS_DLL=^
MINIMAL_AMALGAMATION=1 ^
FOR_WIN10=1 ^
SYMBOLS=0 ^
METADATA=0 ^
EXT_FEATURE_FLAGS= ^
"OPTS=%__EXTENDED_WIN10% %__RECOMMENDED% %__MY%"
set __OPTS_SHELL=^
MINIMAL_AMALGAMATION=0 ^
DYNAMIC_SHELL=0 ^
FOR_WIN10=0 ^
SYMBOLS=1 ^
DEBUG=6 ^
MEMDEBUG=1 ^
"OPTS=%__RECOMMENDED% %__MY_SHELL% %__EXTRA_SHELL% %__EXTENSIONS%"

set NMAKE_OPTS_DEFAULT=^
USE_FULLWARN=1 ^
USE_FATAL_WARN=0 ^
USE_RUNTIME_CHECKS=0 ^
USE_STDCALL=0 ^
USE_SEH=1 ^
DYNAMIC_SHELL=0 ^
API_ARMOR=0 ^
SPLIT_AMALGAMATION=0 ^
STATICALLY_LINK_TCL=0 ^
USE_RPCRT4_LIB=0 ^
USE_LISTINGS=0 ^
XCOMPILE=0 USE_NATIVE_LIBPATHS=0 ^
MEMDEBUG=0 ^
WIN32HEAP=0 ^
OSTRACE=0 ^
ASAN=0 ^
DEBUG=0 ^
OPTIMIZATIONS=2 ^
SESSION=0 ^
RBU=0 ^
FOR_WINRT=0 ^
FOR_UWP=0 ^
"EXTRA_SRC="
rem OPT_FEATURE_FLAGS
rem EXT_FEATURE_FLAGS
rem REQ_FEATURE_FLAGS
set NMAKE_OPTS=^
USE_CRT_DLL=1 ^
USE_RC=0
rem SQLITE3DLL=winsqlite3.dll ^
rem SQLITE3LIB=winsqlite3.lib ^
rem SQLITE3EXE=winsqlite3shell.exe
rem "OPT_XTRA=" "OPTIONS="
rem OPT_FEATURE_FLAGS= ^


pushd "%~dp0"
pushd src
rem mkdir build
rem pushd build

set "_CONFIGBUILD="
if /I "%1" == "/clean" goto CLEAN
if /I "%1" == "/clear" goto CLEAN
if /I "%1" == "/AMA" goto AMALGAMATION
if /I "%1" == "/AMALGAMATION" goto AMALGAMATION
if /I "%1" == "/BUILD" goto BUILD
if /I "%1" == "/EXE" goto BUILDEXE
if /I "%1" == "/BUILDEXE" goto BUILDEXE
if /I "%1" == "/DLL" goto BUILDDLL
if /I "%1" == "/BUILDDLL" goto BUILDDLL
if /I "%1" == "/AUX" goto BUILDTOOLS
if /I "%1" == "/TOOLS" goto BUILDTOOLS
if /I "%1" == "/BUILDTOOLS" goto BUILDTOOLS
if /I "%1" == "" set _CONFIGBUILD=yes


:AMALGAMATION
echo ----------------------AMALGAMATION------------------------------
rem nmake /d /w /f "..\src\Makefile.msc" TOP="..\src" sqlite3.c
rem nmake /?
nmake /f Makefile.msc sqlite3.c

goto END

:BUILD
:BUILDEXE
echo ------------------------BUILDEXE--------------------------------
rem nmake /d /w /f ..\src\Makefile.msc TOP=..\src OPTIONS=-DSQLITE_OMIT_DEPRECATED sqlite3.exe
rem nmake /f Makefile.msc OPTIONS=-DSQLITE_OMIT_DEPRECATED sqlite3.exe USE_RC=1
rem nmake /f Makefile.msc core

:: SHELL_CORE_SRC      - source code that should be compiled
:: SHELL_CORE_DEP      - library that shell should depend on
:: SHELL_CORE_LIB      - library that shell should link with
:: SHELL_COMPILE_OPTS  - compiler opts
:: SHELL_LINK_OPTS     - linker opts
rem set __OPTIONS=%__RECOMMENDED%
::nmake /f Makefile.msc sqlite3.exe USE_RC=0 ^
::            FOR_WIN10=1 ^
::            DYNAMIC_SHELL=0 ^
::                "OPT_XTRA=" ^
::                "OPTIONS=%__RECOMMENDED%" ^
::                "OPTS=%__OPTS%"
rem echo nmake /f Makefile.msc shell USE_RC=0 %NMAKE_OPTS% %__OPTS_SHELL%
nmake /f Makefile.msc shell USE_RC=0 %NMAKE_OPTS% %__OPTS_SHELL%
mkdir %~dp0bin
rem copy /y winsqlite3shell.exe %~dp0bin
copy /y sqlite3.exe %~dp0bin

if ERRORLEVEL==1 goto END
if NOT "%_CONFIGBUILD%" == "" goto BUILDDLL
goto END

:BUILDDLL
echo ------------------------BUILDDLL--------------------------------
rem nmake /f ../src/Makefile.msc TOP=../src sqlite3.dll USE_NATIVE_LIBPATHS=1 "OPTS=%__OPTS%"
rem nmake /f Makefile.msc sqlite3.dll USE_NATIVE_LIBPATHS=1 "OPTS=%__OPTS%"
rem nmake /f Makefile.msc sqlite3.dll FOR_WIN10=1 PLATFORM=%VSCMD_ARG_TGT_ARCH%
rem nmake /f Makefile.msc sqlite3.dll FOR_WIN10=1 PLATFORM=%Platform%

rem nmake /f Makefile.msc clean

:: CORE_CCONV_OPTS
:: CORE_COMPILE_OPTS
:: CORE_LINK_OPTS
::set __OPTS=%__RECOMMENDED% %__OPTIONS%

:: FOR_WIN10 - compile binaries for the Windows 10 platform
:: USE_FULLWARN - /W4
:: DEBUG - 0,1,2,3,4,5,6 (0==NDEBUG)
:: OPTIMIZATIONS - 0,1,2,3 (-Od,-O1,-O2,-Ox)
:: USE_CRT_DLL - force dynamically linking to MSVC runtime library
:: USE_NATIVE_LIBPATHS - use the native libraries for cli-tools needed during compilation
:: USE_LISTINGS - generate assembly code listings for source code files to be compiled
:: API_ARMOR - extra code that detect misuse of SQLite API
::nmake /f Makefile.msc dll USE_RC=0 ^
::            FOR_WIN10=1 ^
::            USE_FULLWARN=1 ^
::            DEBUG=0 ^
::            OPTIMIZATIONS=2 ^
::            USE_CRT_DLL=1 ^
::                MINIMAL_AMALGAMATION=1 ^
::                USE_SEH=1 ^
::                REQ_FEATURE_FLAGS= ^
::                OPT_FEATURE_FLAGS= ^
::                EXT_FEATURE_FLAGS= ^
::               "OPT_XTRA=" ^
::               "OPTIONS=%__OPTIONS%" ^
::               "OPTS=%__OPTS%"
::            rem MEMDEBUG=0 ^
::            rem WIN32HEAP=0 ^
::            rem OSTRACE=0 ^
::            rem ASAN=0 ^
::            rem SESSION=0 ^
::            rem RBU=0 ^
::            rem USE_SEH=1 ^
::        rem XCOMPILE=1 USE_NATIVE_LIBPATHS=1 ^
::        rem USE_LISTINGS=1
::        rem USE_RUNTIME_CHECKS=1 (needs OPTIMIZATIONS=0 or DEBUG>1)
::        rem SYMBOLS=1 (or DEBUG>1)
::        rem API_ARMOR=1 (or DEBUG!=0 or FOR_WIN10!=0)
::        rem OPTIMIZATIONS=3
::        rem OPTIMIZATIONS=1
::        rem OPTIMIZATIONS=0
::        rem DYNAMIC_SHELL=1  :: shell.exe linked to core.dll
rem echo nmake /f Makefile.msc dll USE_RC=0 %NMAKE_OPTS%
nmake /f Makefile.msc dll USE_RC=0 %NMAKE_OPTS% %__OPTS_DLL%
nmake /f Makefile.msc sqlite3.def USE_RC=0

mkdir %~dp0bin
copy /y winsqlite3.dll %~dp0bin\winsqlite3.dll
mkdir %~dp0lib
copy /y winsqlite3.lib %~dp0lib\sqlite3.lib
mkdir %~dp0include
copy /y sqlite3.h %~dp0include
copy /y sqlite3ext.h %~dp0include
copy /y sqlite3rc.h %~dp0include
copy /y sqlite3.def %~dp0include

set DUMPBIN_DIR=%~dp0nmake-dump-release-%platform%
mkdir %DUMPBIN_DIR%
dumpbin /all sqlite3.lo > %DUMPBIN_DIR%\sqlite3.lo.dump.all.txt
rem dumpbin /headers sqlite3.lo > %DUMPBIN_DIR%\sqlite3.lo.dump.headers.txt
rem dumpbin /exports sqlite3.lo > %DUMPBIN_DIR%\sqlite3.lo.dump.exports.txt
rem dumpbin /dependents sqlite3.lo > %DUMPBIN_DIR%\sqlite3.lo.dump.dependents.txt
rem dumpbin /imports sqlite3.lo > %DUMPBIN_DIR%\sqlite3.lo.dump.imports.txt
dumpbin /headers winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.dump.headers.txt
dumpbin /exports winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.dump.exports.txt
dumpbin /dependents winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.dump.dependents.txt
dumpbin /imports winsqlite3.dll > %DUMPBIN_DIR%\winsqlite3.dll.dump.imports.txt


if ERRORLEVEL==1 goto END
if NOT "%_CONFIGBUILD%" == "" goto BUILDTOOLS
goto END

:BUILDTOOLS
echo -----------------------BUILDTOOLS-------------------------------
rem nmake /f ../src/Makefile.msc sqldiff.exe
rem nmake /f ../src/Makefile.msc sqlite3_analyzer.exe
nmake /f Makefile.msc sqldiff.exe USE_RC=0
nmake /f Makefile.msc sqlite3_analyzer.exe USE_RC=0
nmake /f Makefile.msc sqlite3_rsync.exe USE_RC=0
mkdir %~dp0bin
copy /y sqldiff.exe %~dp0bin
copy /y sqlite3_analyzer.exe %~dp0bin
copy /y sqlite3_rsync.exe %~dp0bin

goto END


:CONFIG
echo ------------------------CONFIG----------------------------------
"./configure" --enable-all

goto END


:CLEAN
echo -------------------------CLEAN----------------------------------
nmake /f Makefile.msc clean USE_RC=0

goto END


:END
popd
popd

:ENDLOCAL
endlocal

:EOF
