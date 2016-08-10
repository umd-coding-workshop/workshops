EXERCISE 2:

Now that we've learned the basics of getting around in a bash shell environment, let's learn a little bit more about how commands and files are goverened.

1) Let's start by making sure we're in the right directory by using the following command:

    pwd

You should be in the exercise2 directory.

1.1) Just a piece of housekeeping: before you being the rest of the steps, perform the following command:

    chmod 000 no.txt
    
You'll understand why later.

2) If you ever have any questions about how to properly use a command, use the man command to display the instruction manual for that command:

    man ls
    
You should see the instructions on how to use the ls command.

3) There are some useful tools that let you display information about your current system environment and user profile. To display your user ID, use the following command:

    whoami

Your user name will display.

4) To display your current system hostname, using the following command:

    hostname
    
5) Now that you know who you are and where you are, you can determine what user groups you belong to in your current system environment. Use the following command:

    groups
    
This command displays the groups to which your current user ID is a part of. The 'id' command can also be used to access more in-depth user and group information, but may be a bit overwhelming for early users.

6) Now let's have a look at some files. First let's have a look at the first file:

    cat yes.txt

As you can see, you have access to the contents of this file.

7) Alright, now lets check out the next file:

    cat no.txt
    
Whoops! Looks like you are blocked from reading this file. Let's learn a little bit about user permissions.

8) First let's list out all of the files in the current directory, but let's use the -l modifier. This displays additional information abou the files.

    ls -l
    
Let's unpack this display a little.

    a-----------b-c------d------------e----f------------g----------------
    -----------------------------------------------------------------------
    drwxr-xr-x+ 1 ubuntu Domain Users    0 Jul 26 12:31 directory_example
    -rwxrwxrwx  1 ubuntu Domain Users    0 Jul 26 12:28 full_access.txt
    ----------  1 ubuntu Domain Users 2511 Jul 26 12:37 no.txt
    -rw-rw-rw-  1 ubuntu Domain Users  294 Jul 26 12:27 yes.txt

Using the -l modifier provides a lot of detail about your files. Let's review the types of information you'll get.

a)  Permissions levels: The permissions displayed in this view are shown in the following order: Owner, group, all other users. These permissions are then broken out in to three different types: read (r), write (w), execute (x). As you can see, yes.txt gives read and write permissions to all users while no.txt denies all access to all users.

b)  Number of hard links

c)  Owner: This is the owner who has created the file or has been set as its owner

d)  Group: The dedicated user group with distinct file permissions

e)  File size: File size in bytes.

f)  Last-modified date: Date the file was laste updated.

g)  Filename

9) So, from this display, you can see that  you have full access for full_access.txt, read/write access to yes.txt, and no permissions for no.txt. Now, let's change the permissions for no.txt so that we can display it's contents.

    chmod a+rw no.txt
    
You can also use the following command to achieve the same result

    chmod 666 no.txt
    
The chmod command allows you to change permissions on files and directories. Use the man command to read the full documentation for chmod.

10) Now you should be able to view the contenst of no.txt:

    cat no.txt 

11) Additionally, the chown command can be used to change the file owner. It is unlikely that you will need to use this command while working with your own files.
    


