@echo off
setlocal enabledelayedexpansion

REM ============================
REM  MAX PERFORMANCE DOWNLOAD
REM  Auto-update yt-dlp
REM  Use best video+audio
REM ============================

REM Location of tools
set YT=yt-dlp.exe
set OUT=downloads

if not exist "%OUT%" mkdir "%OUT%"

REM Auto-update yt-dlp (fast, silent)
"%YT%" -U >nul 2>&1

REM Ask for URL if not passed
if "%~1"=="" (
    set /p URL=Enter video/playlist URL: 
) else (
    set URL=%~1
)

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
echo Done!
pause
