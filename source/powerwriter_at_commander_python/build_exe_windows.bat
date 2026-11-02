@echo off
setlocal
cd /d "%~dp0"

echo [PowerWriter AT] Building standalone executables...
python build_exe.py
if errorlevel 1 (
    echo [ERROR] EXE build failed.
    exit /b 1
)
echo.
echo [OK] Output directory: %~dp0dist\
exit /b 0
