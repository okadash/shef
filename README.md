# ABOUT
Shef is the package manager for shell functions. Any function can be downloaded and installed in ~/.shef/core

by [shelib](https://github.com/okadash/shelib) functions.

* convinient to hack
* interoperability in POSIX shells
* 

# USAGE

`shef install @pkg` install shef packages from manifest repository
`shef install https://example.org/path/to/pkg.tgz` install shef packages with URL
`shef list` list installed shef packages
`shef info pkgname`
`shef remove pkgname` remove installed package



# INSTALL

```
cd this_repo_path
./install.sh
```

# INTERNAL

## shelib callstack
shelib is designed to reduce loop declarations, and to unify argument parsing mechanisms for shell functions.

*cook* sets shelib callstack for the cooked function (hereby called **shelib function**) and *callstack* function is immediately invoked after the cook execution. 

*callstack()* function invokes reserved parsers *parsecmds*, *parseopts* and *parseargs* and if you declare these reserved parser functions inside the shelib function, each of them is invoked in the order and the new callstack loop is set to run *shiftstack()* with shift value and arguments $@. 

*shiftstack()* sets a new callstack for arguments $@ and make additional loop for given arguments with shift value. (so two arguments needed)
If no *shiftstack()* runs, all parser and *execute()* simply invoked, and exit.
All shelib function is style-free as like as generic shell functions and any constraints can be freely described in shelib functions in your order, with or without usage of shelib builtin functions.

## shelib global components
These functions are reserved inside *cook*. If exist, they are invoked at one time for the shelib function
* loadenv: good to declare environmental variables for shelib funcitons 
* loadmod: good to load external shell scripts or shell functions

## callstack components
These functions are reserved inside *callstack()*. If exist, they are invoked at several times with *shiftstack()*. If you don't invoke *shiftstack()* inside your shelib function, all callstack component will be simplly invoked at one time and exit.
* parsecmds: subcommand parser, good to describe *if* or *case* syntax for your subcommand definition
* parseopts: option parser
* parseargs: argument parser
* execute: execution stack. if exist, run it at the last of the callstack. If there are any command insersion by *setexec()*, set command runs after *execute*.

## shelib builtin functions
* shelib core library (lib/core) includes shelib builtin functions to be loaded from *cook*
* Now we support 12 shelib builtins: *callstack*, *shiftstack*, *throw*, *silent*, *askyn*, *sanitize*, *setvar*, *require*, *setexec*, *showhelp*, *tabfix* and *chk*

## reserved variables
* shelib uses 4 variables and 3 interators internally: SHELIB_HELP_HEADER, SHELIB_MISC, shelib_setdir_loaded, shelib_askyn_resp, shelib_i, shelib_k and shelib_j. You are not recommended to declare these variables in your scripts.
* *tabfix()* uses 4 description for replacement: SHELIB_CHARDEL, SHELIB_TABADD, SHELIB_TABDEL and BREAK_OPT. You are not recoomended to use these descriptions in your scripts.

# TODO
* make usage documentation
