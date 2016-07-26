EXERCISE 1:

1)  Navigate to the 'exercise1' directory by using the cd command.

    'cd exercise1'

Use pwd command to make sure you are in the correct directory.
    
2)  Let's make some files! Make your first file by entering the following command:

    'touch test01.txt'

Use ls command to see the file you've just created.
    
3)  Now let's make some more files. Use the following command to create some more files you'll need for this exerise: 

    'touch test{02,03}.txt'
    
4)  You can also specify a range of numbers (or letters) with the '..' syntax:
    
    'touch test{04..10}.txt'
    
Again, use the ls command to confirm you've correctly created test01.txt - test10.txt.

5)  Now that we have some files, let's create some additional directories to house them. 

    'mkdir files'
    'mkdir archive'

Use the ls -l command to view the new directories you've created alongside your files.

6)  Move half of your files to the 'files' directory and the rest of the files to the 'archive' directory. Below are examples of how to move files

    'mv test01.txt files/test01.txt'
    'mv test05.txt archive/test05.txt'
    
Navigate to the directories and use the ls command to make sure that your properly moved your files

7) Come to think of it, we don't need test01.txt. Navigate to the correct directory and using the following command:

    'rm test01.txt'
    
Confirm that you've deleted the file and you're done with exersice 1!
