@echo off


:: If no environment argument is passed, list the environments and exit
IF [%1] == [] (
    GOTO :INVALID_ARGUMENT
)


:: Process argument
IF "%1" == "poc" set openshiftenv="POC"
IF "%1" == "PoC" set openshiftenv="POC"
IF "%1" == "POC" set openshiftenv="POC"

IF "%1" == "np" set openshiftenv="NONPRODUCTION"
IF "%1" == "nonprod" set openshiftenv="NONPRODUCTION"
IF "%1" == "non-prod" set openshiftenv="NONPRODUCTION"
IF "%1" == "dev" set openshiftenv="NONPRODUCTION"
IF "%1" == "qa" set openshiftenv="NONPRODUCTION"
IF "%1" == "stg" set openshiftenv="NONPRODUCTION"

IF "%1" == "prod" set openshiftenv="PRODUCTION"
IF "%1" == "production" set openshiftenv="PRODUCTION"


:: Login to Openshift
IF %openshiftenv% == "POC" (
    echo. && echo Logging into OpenShift POC environment...
    oc login <poc-domain>:<port> -u <username>
    GOTO :EOF
) 
IF %openshiftenv% == "NONPRODUCTION" (
    echo. && echo Logging into OpenShift Non-Production environment...
    oc login <nonprod-domain>:<port> -u <username>
    GOTO :EOF
) 
IF %openshiftenv% == "PRODUCTION" (
    echo. && echo Logging into OpenShift Production environment...
    oc login <prod-domain>:<port> -u <username>
    GOTO :EOF
)

:: Print help if arguments are wrong
:INVALID_ARGUMENT
echo. && echo Invalid argument.
echo. && echo Example usage:
echo To login to the POC environment, use '%~n0 poc'
echo To login to the Non-Production environment, use '%~n0 np'
echo To login to the Production environment, use '%~n0 prod'