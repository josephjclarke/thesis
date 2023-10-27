# Thesis
My Thesis

## Building
Build in draft mode with 

```
make
```

Build in final mode with
```
make final
```
and build for printing with

```
make print
```
There are also ```debug``` and ```draftprint``` for interactive error messages and draft mode enabled for two sided printing respectively.
Use ```make doublespacing``` to build in single sided draft mode with double line spacing. 

## Cleaning
Use 

```
make clean
```

to remove the nonessential files generated during build.

Use 
```
make deepclean
``` 

to get rid the output pdf as well.

## Linting
Using 
```
make check
```
will check with lacheck.


## Post Viva Corrections
The draft thesis that was submitted for a *viva* can be found in the ```viva``` branch. To generate a ```pdf``` file comparing the changes from
that viva to the current state of the thesis, use
```
make diff
```
The formatting of this document will be off, and you must have first checked out the ```viva``` branch
