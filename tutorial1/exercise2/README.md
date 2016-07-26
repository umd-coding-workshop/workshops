EXERCISE 2:

Now that we've learned the basics of getting around in a bash shell environment, let's learn a little bit more about how commands and files are goverened.

1) Let's start by making sure we're in the right directory by using the following command:

    cd /exercise2

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

    drwxr-xr-x+ 1 jkoivist Domain Users    0 Jul 26 12:31 directory_example
    -rwxrwxrwx  1 jkoivist Domain Users    0 Jul 26 12:28 full_access.txt
    -rw-rw-rw-  1 jkoivist Domain Users 2511 Jul 26 12:37 no.txt
    -rw-rw-rw-  1 jkoivist Domain Users  294 Jul 26 12:27 yes.txt





man
ls -la
pwd

whoami
hostname?
id -p

chown
chmod

make two users, prepopulate directory with files of varying ownership/permissions (but in the same group), 
to illustrate the implications of permissions

