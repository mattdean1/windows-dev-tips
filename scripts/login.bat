@echo off

:: If no environment argument is passed, list the environments and exit
IF [%1] == [] (
    GOTO :INVALID_ARGUMENT
)

:: Process argument
IF %1 == poc GOTO :LOGIN_POC
IF %1 == PoC GOTO :LOGIN_POC
IF %1 == POC GOTO :LOGIN_POC

IF %1 == np GOTO :LOGIN_NONPROD
IF %1 == nonprod GOTO :LOGIN_NONPROD
IF %1 == non-prod GOTO :LOGIN_NONPROD
IF %1 == dev GOTO :LOGIN_NONPROD
IF %1 == qa GOTO :LOGIN_NONPROD
IF %1 == stg GOTO :LOGIN_NONPROD

IF %1 == prod GOTO :LOGIN_PROD
IF %1 == production GOTO :LOGIN_PROD

:INVALID_ARGUMENT
echo. && echo Invalid argument.
echo. && echo Example usage:
echo To login to the POC environment, use '%~n0 poc'
echo To login to the Non-Production environment, use '%~n0 np'
echo To login to the Production environment, use '%~n0 prod'
GOTO :EOF


:LOGIN_POC
    echo. && echo Logging into OpenShift POC environment...
    oc login <domain>:<port> -u <username>
    GOTO :EOF
    
:LOGIN_NONPROD
    echo. && echo Logging into OpenShift Non-Production environment...
    oc login <domain>:<port> -u <username>
    GOTO :EOF

:LOGIN_PROD
    echo. && echo Logging into OpenShift Production environment...
    oc login <domain>:<port> -u <username>
    GOTO :EOF
