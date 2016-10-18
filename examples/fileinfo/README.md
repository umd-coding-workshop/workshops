# fileinfo.sh

This script is useful for getting information about files. Used together with built-in commands such as find and wc, as well as shell globbing, it is able to generate information and lists about sets of files matching arbitrary criteria, including creatiing md5 checksums that can be used to ensure file integrity.

The script is a basic loop, that will perform three commands on all the arguments passed to it (it is up to the user to ensure that only filenames are passed as arguments -- this version does not handle directories gracefully):

  1. it gets the size of the file in bytes
  2. it generates an md5 checksum for the file
  3. it prints the filename, size, and checksum, separated by tabs
  
Examples of usage:

Given a directory of files of various types, one could use this to create a list of all the pdf files in the directory by doing 

    $ ./fileinfo.sh *.pdf
    
Given a tree of directories and files, one could use this to create a list of all files by doing

    $ ./fileinfo.sh $(find . -type f)
    
There are many other ways one might use this script, or extend it to fit particular scenarios.

