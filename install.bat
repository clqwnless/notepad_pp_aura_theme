@echo off

rem path where batch is located

set root_path=%~dp0


:main

call :all_sources

echo.

set choice=

set /p choice="[*] would you like to change the main notepad++ theme (stylers.xml) to this one? (yes/no): "

if /i %choice% == yes (
    mkdir "%appdata%\Notepad++" > nul 2>&1
	
    echo.
    
    echo  [*INFO] making backup of current stylers.xml
    
    if not exist "%appdata%\Notepad++\stylers.xml" (
		echo.
        echo  [*ERROR] no stylers.xml in "%appdata%\Notepad++\stylers.xml" found
        echo  [*INFO] skipping . . .
    ) else (
        mkdir "%root_path%\backup" > nul 2>&1
        
        copy /y "%appdata%\Notepad++\stylers.xml" "%root_path%\backup\stylers_backup.xml" > nul 2>&1
    )
    
    copy /y "%root_path%\theme\stylers.xml" "%appdata%\Notepad++" > nul 2>&1
) else if /i %choice% == no (
    mkdir "%appdata%\Notepad++\themes" > nul 2>&1
    
    copy /y "%root_path%\theme\stylers.xml" "%appdata%\Notepad++\themes\aura-theme.xml" > nul 2>&1
) else (
    goto main
)

echo.

:sub_main

set choice=

set /p choice="[*] would you like to add configuration file (config.xml)? (yes/no): "

if not defined choice (
    goto sub_main
)

if /i %choice% == yes (
    mkdir "%appdata%\Notepad++" > nul 2>&1

    echo.
    
    echo  [*INFO] making backup of current config.xml
    
    if not exist "%appdata%\Notepad++\config.xml" (
        echo.
    
        echo  [*ERROR] no config.xml in "%appdata%\Notepad++\config.xml" found
        echo  [*INFO] skipping . . .
    ) else (
        mkdir "%root_path%\backup" > nul 2>&1
        
        copy /y "%appdata%\Notepad++\config.xml" "%root_path%\backup\config_backup.xml" > nul 2>&1
    )
    
    copy /y "%root_path%\theme\config.xml" "%appdata%\Notepad++" > nul 2>&1
)

echo.

echo  [*INFO] done

echo.

pause

exit /b 0

:all_sources

if not exist "%root_path%\theme" (
    echo.
    
    echo  [*ERROR] theme folder not found
    
    echo.
    
    pause
    
    exit 1
)

if not exist "%root_path%\theme\stylers.xml" (
    echo.
    
    echo  [*ERROR] stylers.xml not found
    
    echo.
    
    pause
    
    exit 1
)

if not exist "%root_path%\theme\config.xml" (
    echo.
    
    echo  [*ERROR] config.xml not found

    echo.
    
    pause
    
    exit 1
)

exit /b 0
