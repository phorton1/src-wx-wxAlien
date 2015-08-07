@echo off
rem prh_configure.bat
rem
rem Assumes that a clean build is being done, so first of all calls prh_build clean
rem and removes the _build directory and any artifacts of previous configures.
rem
rem THIS SHOULD PROBABLY NOT BE CALLED FOR THE FIRST TIME SETUP
rem
rem The first time setup was tricky.  Starting with a clean install,
rem I let Build.PL download wxWidgets 3.0.2 from wxWidgets.org and build it,
rem then using a separate download of the same, I created a git repository,
rem stuck that repository in the built 3.0.2, created branches, etc, so that
rem I could "commit" the initial changes made by Build.pl's "patch" process,
rem and my subsequent changes, which have since been posted to github.
rem
rem I still don't have a good strategy for "merging" into future versions of wxPerl
rem
rem So, without delving too deeply into Build.PL, this script takes advantage of the
rem fact that when asked if I want to download and build wxWidgets, we say yes to 3.0.2,
rem but Build.pl does notthing, either because there's already a wxWidgets-3.0.2 subdirectory,
rem or the tar.gz file just happens to be sitting in the directory.  In either case
rem that is the desired behviour ... DONT download a new friggin wxWidgets!
rem
rem Apart from the "cleanup" before a re-configure, the only other thing I am
rem trying to at this time is pass -DPRH_DEBUG to the compiler ...

@echo.
@echo -----------------------------------------------------
@echo.
@echo Cleaning old build ...

del /F /Q /S wxWidgets-3.0.2\build\msw\gcc_mswudll\*.* > nul 2>&1
del /F /Q /S _build\*.* > nul 2>&1
del /F /Q /S _build\* > nul 2>&1
rmdir /Q /S _build > nul 2>&1
rmdir /Q /S blib > nul 2>&1
del /F /Q *.tmp > nul 2>&1
del /F /Q Build > nul 2>&1
del /F /Q Build.bat > nul 2>&1
del /F /Q MYMETA.yml > nul 2>&1

@echo Creating new configuration


(
echo y
echo.
echo.
echo.
) > "prh.tmp"

rem old - unused - CFLAGS passed thru prh_build.bat (environment)
rem could NOT figure out how two pass TWO compile
rem flags to wxWidgets build (wanted PRH_DEBUG separate)
rem perl Build.PL --wxWidgets-extraflags=CFLAGS=-DPRH_CHANGES < prh.tmp  rem 2>NUL

perl Build.PL < prh.tmp 2>NUL

del /F /Q prh.tmp

:END
endlocal
