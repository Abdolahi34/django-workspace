@echo off
:: Set variables for virtual environment and project paths
set venvPath="C:\path\to\venv"
set projectPath="C:\path\to\django\project"

:: Check if venv directory exists
if exist "%venvPath%\Scripts\activate.bat" (
    echo Activating virtual environment...
    call %venvPath%\Scripts\activate.bat
    :: Check if manage.py exists
    if exist "%projectPath%\manage.py" (
        :: Change directory to project
        cd /d %projectPath%
        :: Run Django server
        python manage.py runserver
        :: Keep window after pressing ctrl + c
        pause
        exit
    ) else (
        echo manage.py not found in %projectPath%!
        pause
    )
) else (
    echo Virtual environment not found at %venvPath%
    pause
)
