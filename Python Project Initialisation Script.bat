@echo  off
REM setting working directory to location of .bat file
cd /d "%~dp0"
echo Directory set as: %cd%
REM allows printing of current folder as project folder 
for %%i in (%cd%) do set "ProjectFolder=%%~nxI"

REM setting up a confirmation dialogue within command prompt
echo.
echo This script will initialise a PY project under the name %ProjectFolder% with the directory: %CD%. & echo. & echo Are you sure you wish to proceed? (Y/N):
REM allows for user input under variable name confirm
:REPROMPT
set /P confirm=
REM using labels to control option selection 
if /i "%confirm%"=="Y" goto RUN
if /i "%confirm%"=="N" goto ABORT
REM in the event of misinput will loop back up to reprompt label 
echo Invalid input. Please enter Y or N.
goto REPROMPT

REM moving to desired code block using labels
REM cancel project folder initialisation 
:ABORT
echo. & echo Project folder initialisation has been aborted & echo.
goto END

REM confirm and initialise project folder
:RUN
echo Initialising project with UV
uv init --no-workspace 

echo Creating and populating .vscode directory
mkdir .vscode
cd .vscode 
REM creating populated settings.json file
(
echo {
echo     "workbench.colorTheme": "Kimbie Dark",
echo.
echo     "workbench.colorCustomizations": {
echo         "titleBar.activeBackground": "#ffead3",
echo 		 "titleBar.activeForeground": "#000000" 
echo     },
echo.
echo     "python.analysis.extraPaths": [
echo         "${workspaceFolder}/src"
echo     ]
echo }
) > settings.json
REM creating empty extensions.json file
type nul > extensions.json
cd ..

REM creating and populating source directory 
echo Creating and populating src directory
mkdir src
move hello.py src/main.py

REM package handling
echo.
echo If no packages are desired, leave blank. Packages can be added with uv add "packagename" at any time.
REM user input for desired packages seperated by commas or spaces. Utilizes uv add "package-name" for each package via for loop
set /P packages=Please enter desired package names (comma or space seperated): 
if "%packages%"=="" (
	echo No packages selected. Skipping package installation...
) else (
	set packages=%packages:,= %
	for %%p in (%packages%) do (
		echo.
		echo Installing %%p...
		echo.
		uv add %%p 
		echo.
	)
echo Finished installing: %packages%
)
echo Opening project folder in VSCode
start code .
goto END

REM keeps cmd open after conculsion of script operation 
:END
echo Press any key to close...
pause >nul