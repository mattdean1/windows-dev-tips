# Tips for developing on Windows

At work I have to develop on a Windows machine, which has created more than a few headaches since I used a unix system for the past 5+ years.

This repo contains a collection of useful information, links, scripts, and other resources to help myself and others get up to speed developing on windows faster.


## Apps

[Cmder](http://cmder.net/) is my favourite tool for making the command line more unix-y in Windows. This tool is not as powerful as Cygwin but gives you a number of common unix commands out the box, as well as great keyboard shortcuts, git support and colour scheme.

*Example commands in the rest of this guide will assume you are using Cmder*


## Scripts

#### Setup

Scripts are a fantastic way to automate common tasks and save time. One way to have easy access to scripts is add a `scripts` directory to your PATH.

1. `mkdir C:/Users/<username>/scripts`
2. Append `;C:/Users/<username>/scripts` to your PATH using [these instructions](https://www.java.com/en/download/help/path.xml)
3. Get scripting!

You could clone this repo and add the `scripts` folder to your PATH using the instructions above - replace `C:/Users/<username>/scripts` with the path to the folder.

#### Usage

Run scripts by simply typing the name of script, for example:

For a script named `script.bat` type `script`


#### Naming

Be careful when naming your scripts that you do not use the same name as any Windows or Cmder commands - it could overwrite them!

e.g. a script name `env.bat` would be called when typing `env` instead of the Cmder `env` function which lists environment variables.

You could avoid this problem by prefixing your scripts with a common character e.g. an underscore.

## .gitattributes

On Windows, git checks out files with 'Windows' (CLRF) line endings by default. This sometimes shows up as ESLint errors in Atom which can be annoying. To fix this, add the `.gitattributes` file in the root of your project, which ensures Git will checkout JS files with the correct (LF) line endings.

You may need to re-checkout the files to pick up the change.


## Other resources

[Microsoft's tips and guidelines for setting up a Node.js development environment on Windows](https://github.com/Microsoft/nodejs-guidelines/blob/master/windows-environment.md#configuring-your-windows-development-environment)

[The easiest way to install dependencies for compiling native Node modules on Windows](https://github.com/felixrieseberg/windows-build-tools)

[An easy way to upgrade NPM](https://github.com/felixrieseberg/npm-windows-upgrade)

[A complete guide to setting up a modern developer environment on windows](https://github.com/felixrieseberg/windows-development-environment)


