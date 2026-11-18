@echo off
echo Building jasper-bangla-fonts.jar...
if not exist target mkdir target

where mvn >nul 2>nul
if %errorlevel%==0 (
    call mvn clean package
) else (
    where jar >nul 2>nul
    if %errorlevel%==0 (
        jar cf target\jasper-bangla-fonts.jar -C src\main\resources .
        echo Built target\jasper-bangla-fonts.jar using JDK jar tool.
    ) else (
        echo ERROR: Neither Maven (mvn) nor JDK (jar) was found in PATH.
        pause
        exit /b 1
    )
)
echo Done! Output JAR is in target\jasper-bangla-fonts.jar
pause
