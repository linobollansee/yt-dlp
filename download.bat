@echo off
setlocal enabledelayedexpansion

REM ============================
REM  MAX PERFORMANCE DOWNLOAD LOOP
REM  Prompt first → update → download
REM  No pause between downloads
REM ============================

REM Location of tools
set YT=yt-dlp.exe
set OUT=downloads

if not exist "%OUT%" mkdir "%OUT%"

:START
cls
echo ============================
echo   YT-DLP MAX DOWNLOAD
echo ============================
echo.

set URL=
set /p URL=Enter video/playlist URL (or X to exit): 

if /I "%URL%"=="X" goto END
if "%URL%"=="" goto START

echo Checking for updates...
"%YT%" -U >nul 2>&1

echo.
echo Downloading...
"%YT%" ^
 -f "bv*+ba/b" ^
 --merge-output-format mp4 ^
 --embed-thumbnail ^
 --embed-metadata ^
 --concurrent-fragments 32 ^
 -N 32 ^
 -o "%OUT%/%%(title)s.%%(ext)s" ^
 "%URL%"

echo.
echo Download complete! Starting next...
timeout /t 1 >nul

goto START

:END
echo Exiting...
