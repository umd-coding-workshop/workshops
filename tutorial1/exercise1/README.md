# Exercise 1: Basic System Navigation and File Creation/Removal

## 1. Orienting Yourself and Navigating (cd, pwd)
Navigate to the 'exercise1' directory by using the cd command.

    cd exercise1

Use pwd command to make sure you are in the correct directory.
    
## 2. Create Files and List Directory Contents (touch, ls)
Let's make some files! Make your first file by entering the following command:

    touch test01.txt

Use ls command to see the file you've just created.
    
## 3. Brace Expansion ({,})
Now let's make some more files. Use the following command to create some more files you'll need for this exerise: 

    touch test{02,03}.txt
    
## 4. Brace Expansion with Ranges ({..})
You can also specify a range of numbers (or letters) with the '..' syntax:
    
    touch test{04..10}.txt
    
Again, use the ls command to confirm you've correctly created test01.txt - test10.txt.
If you are completing this tutorial on a MAC, the previous command may leave off the preceeding zero in the filenames.

## 5. Create Directories (mkdir)
Now that we have some files, let's create some additional directories to house them. 

    mkdir files
    mkdir archive

Use the ls -l command to view the new directories you've created alongside your files. This command displays the long format of your file list. Directories are indicated by a "d" at the very beginning of the line listing.

## 6. Move/Rename Files and Directories (mv)
Move half of your files to the 'files' directory and the rest of the files to the 'archive' directory. Below are examples of how to move files

    mv test01.txt files/test01.txt
    mv test05.txt archive/
    
You can write out the long form of the command by including the file name although it is not required.  The mv command is also the easiest way to change the name of a file or directory.  Contrary to what you might expect "move" does not move anything, but rather updates the way a file is registered by the system (either changing the name or changing the directory where it is listed as residing (but *not* the physical location of the bits on disk).
    
Navigate to the directories using the cd command and use the ls command to make sure that your properly moved your files.

    cd archives

## 7. Delete Files (rm)
Come to think of it, we don't need test01.txt. Navigate to the correct directory and using the following command:

    rm test01.txt
    
Confirm that you've deleted the file and you're done with exersice 1!
