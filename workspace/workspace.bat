@echo off
setlocal enabledelayedexpansion

:: ============================================
:: ArkIDE Workspace Setup Script
:: ============================================

color 0A
cls
echo ========================================
echo    ArkIDE Workspace Setup Script
echo ========================================
echo.

:: Configuration
set "ARKIDE_WORKSPACE_DIR=%USERPROFILE%\ArkIDE_Workspace"

:: Repository URLs (customize these)
set "REPO1=https://github.com/The-ArkIDE-Project/ArkIDE-Home.git"
set "REPO2=https://github.com/The-ArkIDE-Project/arkide-new.git"
set "REPO3=https://github.com/The-ArkIDE-Project/ArkIDE-Desktop.git"
set "REPO4=https://github.com/The-ArkIDE-Project/ArkIDE-ObjectLibraries.git"
set "REPO5=https://github.com/The-ArkIDE-Project/ArkIDE-ExtensionGallery.git"

:: Display configuration
echo Workspace Directory: %ARKIDE_WORKSPACE_DIR%
echo.
echo Repositories to clone:
echo   * %REPO1%
echo   * %REPO2%
echo   * %REPO3%
echo   * %REPO4%
echo   * %REPO5%
echo.

:: Confirmation prompt
:PROMPT
set /p "CONFIRM=Do you want to proceed with cloning these repositories? (Y/N): "
if /i "%CONFIRM%"=="Y" goto PROCEED
if /i "%CONFIRM%"=="N" goto CANCEL
echo Invalid input. Please enter Y or N.
goto PROMPT

:CANCEL
echo.
echo [X] Setup cancelled by user.
pause
exit /b 0

:PROCEED
echo.
echo [OK] Starting setup...
echo.

:: Create workspace directory
if not exist "%ARKIDE_WORKSPACE_DIR%" mkdir "%ARKIDE_WORKSPACE_DIR%"
cd /d "%ARKIDE_WORKSPACE_DIR%"

:: Clone repositories
echo [CLONE] Cloning repositories...
git clone %REPO1%
git clone %REPO2%
git clone %REPO3%
REM git clone %REPO4%
REM git clone %REPO5%

echo.
echo [CLEAN] Removing .git folders...

:: Remove all .git folders
for /d /r "%ARKIDE_WORKSPACE_DIR%" %%G in (.git) do (
    if exist "%%G" (
        echo   Removing: %%G
        rmdir /s /q "%%G"
    )
)

echo.
echo ========================================
echo    Setup Complete!
echo ========================================
echo.
echo Workspace location: %ARKIDE_WORKSPACE_DIR%
echo.
pause