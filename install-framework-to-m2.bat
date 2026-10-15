@echo off
:: ========================================================================
::  RoadMap Framework 1.0.0 — Offline M2 & IDE Installer
:: ========================================================================
::  Installs roadmap-framework-1.0.0 into local Maven repository (.m2)
::  and Eclipse Lemminx cache so it resolves instantly with ZERO errors.
:: ========================================================================

setlocal

set SCRIPT_DIR=%~dp0
set GROUP_PATH=com\roadmap\framework\roadmap-framework\1.0.0
set SOURCE_DIR=%SCRIPT_DIR%lib\%GROUP_PATH%
set TARGET_M2=%USERPROFILE%\.m2\repository\%GROUP_PATH%
set TARGET_LEMMINX=%USERPROFILE%\.m2\.lemminx-maven\%GROUP_PATH%

echo.
echo =======================================================================
echo  Installing RoadMap Framework 1.0.0 to local Maven ^& IDE repositories
echo =======================================================================
echo.
echo Source : %SOURCE_DIR%
echo Target : %TARGET_M2%
echo.

if not exist "%TARGET_M2%" (
    mkdir "%TARGET_M2%"
)
if not exist "%TARGET_LEMMINX%" (
    mkdir "%TARGET_LEMMINX%"
)

:: Copy JAR and POM to .m2
copy /Y "%SOURCE_DIR%\roadmap-framework-1.0.0.jar" "%TARGET_M2%\" >nul
copy /Y "%SOURCE_DIR%\roadmap-framework-1.0.0.pom" "%TARGET_M2%\" >nul

:: Copy JAR and POM to .lemminx-maven
copy /Y "%SOURCE_DIR%\roadmap-framework-1.0.0.jar" "%TARGET_LEMMINX%\" >nul
copy /Y "%SOURCE_DIR%\roadmap-framework-1.0.0.pom" "%TARGET_LEMMINX%\" >nul

:: Clean any stale .lastUpdated or error tracking files
del /Q /F "%TARGET_M2%\*.lastUpdated" 2>nul
del /Q /F "%TARGET_M2%\m2e-lastUpdated.properties" 2>nul
del /Q /F "%TARGET_LEMMINX%\*.lastUpdated" 2>nul

:: Write clean _remote.repositories
(
echo #NOTE: This is a Maven Resolver internal implementation file.
echo roadmap-framework-1.0.0.jar^>=
echo roadmap-framework-1.0.0.pom^>=
echo roadmap-framework-1.0.0.jar^>github=
echo roadmap-framework-1.0.0.pom^>github=
echo roadmap-framework-1.0.0.jar^>in-project-repository=
echo roadmap-framework-1.0.0.pom^>in-project-repository=
) > "%TARGET_M2%\_remote.repositories"

copy /Y "%TARGET_M2%\_remote.repositories" "%TARGET_LEMMINX%\" >nul

echo =======================================================================
echo  SUCCESS! RoadMap Framework 1.0.0 is installed and ready to work!
echo =======================================================================
echo.
echo  In Eclipse:
echo    1. Right-click 'RoadMapERP_Tests' project
echo    2. Select: Maven -^> Update Project... (or press Alt + F5)
echo    3. Click OK.
echo.
pause
endlocal
