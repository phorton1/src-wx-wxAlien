@echo off
rem prh_build.bat for /src/wx/wxAlien
rem
rem This follows a clean "perl Build.PL", where we let wxAlien download
rem wxWidgets 3.0.2 and apply some patches to it. When I copy the .git
rem to this directory, it should tell me what those changes were.
rem
rem To address the fact that having a "bash shell", of which I have at least two,
rem in the path, will cause a problem.   The first bash shell listed should be
rem MinGW/MSys/1.0/bin, and (at least) another is in /Program Files (x86)/Git/bin.


rem These are all the paths on machine at this time
rem Really no good way to subtract one or two ...

rem C:\Program Files (x86)\ActiveState Komodo Edit 8\;
rem C:\Program Files (x86)\PC Connectivity Solution\;
rem C:\Perl\site\bin;
rem C:\Perl\bin;
rem C:\Program Files (x86)\Intel\iCLS Client\;
rem C:\Program Files\Intel\iCLS Client\;
rem C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;
rem %SystemRoot%\system32;
rem %SystemRoot%;
rem %SystemRoot%\System32\Wbem;
rem %SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;
rem C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;
rem C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;
rem C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;
rem C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT;
rem C:\Program Files\Intel\WiFi\bin\;
rem C:\Program Files\Common Files\Intel\WirelessCommon\;
rem C:\Program Files (x86)\Microsoft SQL Server\80\Tools\Binn\;
rem C:\Perl\site\lib\Alien\wxWidgets\msw_2_8_12_uni_cl_0\lib;
rem c:\MinGW\bin;
rem c:\base\bat;
rem C:\Program Files (x86)\Windows Live\Shared;
rem C:\Program Files (x86)\QuickTime\QTSystem\;
rem C:\Program Files (x86)\GnuWin32;
rem C:\Program Files (x86)\Skype\Phone\;
rem C:\dev\android-ndk-r10e;
rem C:\Program Files (x86)\Git\bin

rem Set the minimal path = minGW + perl + enough of windows for cmd.exe

set SAVE_PATH=%PATH%
set PATH=c:\MinGW\bin;c:\Perl\Bin;c:\Perl\site\bin;%SystemRoot%\system32;%SystemRoot%;

rem another problem is that "clean" doesn't clean wxWidgets

if "%1" EQU "clean" (
    @echo Cleaning wxWidgets ...
    del /Q /F wxWidgets-3.0.2\build\msw\gcc_mswudll\*.*
)

rem old - unused - my compiler flags
rem set CFLAGS=-DPRH_CHANGES
rem set CXXFLAGS=-DPRH_CHANGES

rem Do the build (maybe clean)

@echo on
perl build %1

@echo off
set PATH=%SAVE_PATH%
