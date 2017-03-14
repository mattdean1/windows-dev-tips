@echo off

:: Use this script to set proxy variables which require basic authentication

:: Use Powershell to hide password when typing and avoid it appearing in console history (snippet from http://stackoverflow.com/a/20343074)
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p

:: Check user entered a non-empty password
IF [%password%] == [] (
    echo Error: Please enter a password
    echo Info: Proxy environment variables unaltered
    GOTO :EOF
)

:: Set environment vars
set HTTP_PROXY=http://<username>:%password%@<domain>:<port>
set HTTPS_PROXY=https://<username>:%password%@<domain>:<port>

:: Unset password var
set password=

:: Print a friendly message
echo Info: HTTP_PROXY and HTTPS_PROXY environment variables set
