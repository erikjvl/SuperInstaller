@echo off
cls
echo.
echo.SuperInstaller.cmd 
echo.
echo.
echo.
echo.
echo.==============================================================
echo.
echo.Make sure this script is started with elevated privileges
echo.(administrator rights).
echo.
echo.==============================================================
echo.
echo.
echo.
echo.
echo.
echo.

rem Install or update the choco tool. Details: https://chocolatey.org/
powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin 

 
rem The next lines will:
rem 1. install one package per line (parameter 1)
rem 2. copy the shortcut (parameter 3) of the program to the given "start menu group" (parameter 2)
rem 3. delete the directory with shortcutes of the program (parameter 4)
rem   
rem Parameters    :Package name                   , Start menu group , Shortcut to copy        , Start menu group to remove        
 
rem Common Packages
call:superInstall  "cmder"                        ,"Tools"           ,"cmder"                  ,"cmder"
call:superInstall  "ditto"                        ,"Tools"           ,"ditto"                  ,"ditto"
call:superInstall  "adobereader"                  ,"Tools"           ,"Adobe Reader"           ,"Adobe Reader XI"
call:superInstall  "Teamviewer"                   ,"Tools"           ,"TeamViewer"             ,"TeamViewer 10"
call:superInstall  "fsviewer"                     ,"Tools"           ,"Faststone Image Viewer" ,"Faststone Image Viewer"
call:superInstall  "gimp"                         ,"Tools"           ,"GIMP 2"                 ,"N/A"
call:superInstall  "firefox"                      ,"Tools"           ,"Mozilla Firefox"        ,"Mozilla Firefox"
call:superInstall  "GoogleChrome"                 ,"Tools"           ,"Google Chrome"          ,"Google Chrome" 
call:superInstall  "7zip"                         ,"Tools"           ,"7-Zip"                  ,"7-Zip File Manager" 
call:superInstall  "dropbox"                      ,"Tools"           ,"Dropbox"                ,"Dropbox" 
call:superInstall  "ccleaner"                     ,"Tools"           ,"CCleaner"               ,"CCleaner"
call:superInstall  "notepadplusplus"              ,"Tools"           ,"notepad++"              ,"notepad++" 


rem Multimedia
call:superInstall  "lame-front-end"               ,"Tools"           ,"Lame Front-End"         ,"Lame Front-End"
call:superInstall  "vlc"                          ,"Tools"           ,"VideoLAN"               ,"VLC media player"
call:superInstall  "quicktime"                    ,"Tools"           ,"Quicktime"              ,"Quicktime player"
call:superInstall  "handbrake.install"            ,"Tools"           ,"Handbrake"              ,"Handbrake"
call:superInstall  "mp3tag"                       ,"Tools"           ,"Mp3tag"                 ,"Mp3tag"
call:superInstall  "XBMC"                         ,"Tools"           ,"XBMC"                   ,"XBMC"
call:superInstall  "paint.net"                    ,"Tools"           ,"Paint.net"              ,"Paint.net"


rem For powerusers and developers only
call:superInstall  "SublimeText3.PackageControl"  ,"Tools"           ,"Sublime Text 3"         ,"N/A" 
call:superInstall  "filezilla"                    ,"Tools"           ,"Filezilla FTP Client"   ,"Filezilla"
call:superInstall  "GoogleChrome.Canary"          ,"Tools"           ,"Google Chrome Canary"   ,"Google Chrome Canary" 
call:superInstall  "zoomit"                       ,"Tools"           ,"NA"                     ,"N/A"
call:superInstall  "putty.install"                ,"Tools"           ,"NA"                     ,"N/A"


rem Package with still some userinteraction
call:superInstall  "freecommander"                ,"Tools"           ,"Freecommander XE"       ,"Freecommander XE"
call:superInstall  "webpi"                        ,"Tools"           ,"Microsoft Web Platform Installer","NA" 

cls
echo.
echo. ==================
echo.
echo. End of script
echo.
echo. ==================
echo.
pause


goto :eof









::--------------------------------------------------------
::-- Function section starts below here
::--------------------------------------------------------

:superInstall 
cls
set         instName=%~1
set         startGroup=%~2
set         progDir=%~3
set         startDisplayname=%~4

echo.%instName%
echo.

cinst       %instName%

set         allUsersStart=C:\Users\All Users\Microsoft\Windows\Start Menu\Programs
set         destDir=%allUsersStart%\%startGroup%
mkdir       "%destDir%"


copy        "%allUsersStart%\%progDir%\%startDisplayname%.lnk"  "%destDir%\"
del /q      "%allUsersStart%\%progDir%\*.*"
rmdir       "%allUsersStart%\%progDir%"

set         thisUserStart=%AppData%\Microsoft\Windows\Start Menu\Programs
copy        "%thisUserStart%\%progDir%\%startDisplayname%.lnk"  "%destDir%\"

del /q      "%thisUserStart%\%progDir%\*.*"
rmdir       "%thisUserStart%\%progDir%"

copy        "%userProfile%\Desktop\%startDisplayname%.lnk"  "%destDir%\"
del         "%userProfile%\Desktop\%startDisplayname%.lnk"

copy        "C:\Users\Public\Desktop\%startDisplayname%.lnk" "%destDir%\"
del         "C:\Users\Public\Desktop\%startDisplayname%.lnk"

copy        "%programdata%\microsoft\windows\start menu\programs\%startDisplayname%.lnk" "%destDir%\"
del         "%programdata%\microsoft\windows\start menu\programs\%startDisplayname%.lnk"

goto:eof



