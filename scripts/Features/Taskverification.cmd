tasklist /FI "IMAGENAME eq Taskmgr.exe" 2>NUL | find /I /N "Taskmgr.exe">NUL
if "%ERRORLEVEL%"=="0" (
    call Scripts\Features\cena.cmd rostog
    call Scripts\Features\typewriter.cmd "- TENTANDO ME MATAR?"
    call Scripts\Features\typewriter.cmd "- NAO VAI FUNCIONAR."
    taskkill /f /im Taskmgr.exe
)