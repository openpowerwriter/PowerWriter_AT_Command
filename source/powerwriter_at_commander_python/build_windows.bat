@echo off
setlocal
cd /d "%~dp0"

set "ARCH=%~1"
if "%ARCH%"=="" set "ARCH=x64"

where cmake >nul 2>nul
if errorlevel 1 (
    echo [ERROR] CMake was not found in PATH.
    echo Install CMake and Visual Studio Build Tools first.
    exit /b 1
)

echo [PowerWriter AT] Configuring C library ^(arch=%ARCH%^)...
cmake -S . -B build -A %ARCH%
if errorlevel 1 goto :fail

echo [PowerWriter AT] Building Release...
cmake --build build --config Release
if errorlevel 1 goto :fail

echo.
echo [OK] Library output: %~dp0lib\windows\
exit /b 0

:fail
echo [ERROR] Build failed.
exit /b 1
