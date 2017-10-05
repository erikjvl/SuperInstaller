@echo off
cls
echo.
echo.SimpleSuperInstaller.cmd version 2017.10.05
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
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install "notepadplusplus" -y
choco install "adobereader" -y
choco install "Teamviewer" -y
choco install "firefox" -y  
choco install "GoogleChrome" -y
choco install "7zip" -y
choco install "dropbox" -y
choco install "ccleaner" -y
choco install "vlc" -y
choco install "paint.net" -y
choco install "filezilla" -y
choco install "GoogleChrome.Canary" -y
choco install "zoomit" -y
choco install "putty.install" -y
choco install "visualstudiocode" -y
choco install "freecommander" -y
