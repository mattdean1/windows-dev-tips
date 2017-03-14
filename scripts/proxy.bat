@echo off

:: List environment vars
IF "%1" == "list" (
    echo. && echo Proxy environment variable values:
    echo HTTP_PROXY = %HTTP_PROXY%
    echo HTTPS_PROXY = %HTTPS_PROXY%
    GOTO :EOF
)

:: Set environment vars
IF "%1" == "set" (
    set HTTP_PROXY=http://<domain>:<port>
    set HTTPS_PROXY=http://<domain>:<port>

    set npm_config_proxy=http://<domain>:<port>
    set npm_config_https-proxy=http://<domain>:<port>

    echo. && echo Info: Set proxy environment variables
    echo Hint: Use '%~n0 list' to see the current values of the variables
    GOTO :EOF
)

:: Unset environment vars
IF "%1" == "unset" (
    set HTTP_PROXY=
    set HTTPS_PROXY=

    set npm_config_proxy=
    set npm_config_https-proxy=
    npm config rm proxy
    npm config rm https-proxy

    echo. && echo Info: Unset proxy environment variables
    GOTO :EOF
)

:: Set environment vars with auth
IF "%1" == "auth" (
    GOTO :auth
)

:: Display help text if arguments are invalid
echo.
echo Usage:
echo 1. '%~n0 list' will list the current values of the proxy environment variables
echo.
echo 2. '%~n0 set' will set the standard proxy environment variables
echo.
echo 3. '%~n0 unset' will unset any previously set proxy environment variables
echo.
echo 4. '%~n0 auth' will set authenticated proxy environment variables with a prompt for your password
echo.
GOTO :EOF

:auth
    :: Use Powershell to hide password when typing and avoid it appearing in console history (snippet from http://stackoverflow.com/a/20343074)
    set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
    for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p

    :: Check user entered a non-empty password
    IF [%password%] == [] (
        echo. && echo Error: Please enter a password
        echo. && echo Info: Proxy environment variables unaltered
        GOTO :EOF
    )

    :: Set environment vars
    set HTTP_PROXY=http://<username>:%password%@<domain>:<port>
    set HTTPS_PROXY=http://<username>:%password%@<domain>:<port>
    set npm_config_proxy=http://<username>:%password%@<domain>:<port>
    set npm_config_https-proxy=http://<username>:%password%@<domain>:<port>

    :: Unset password var
    set password=

    :: Print a friendly message
    echo. && echo Info: Set proxy environment variables with authentication
    echo Hint: Use '%~n0 list' to see the current values of the variables
    GOTO :EOF
