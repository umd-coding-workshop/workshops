We've gotten a lot more familiar with moving around in a BASH shell environment. Now, we're going to learn a bit about how BASH allows you to use globbing, quoting, and escaping to more efficiently find resources in your system.

1) First things first, let's make sure we're in the right directory.

    pwd
    
You should be in the exercise3 directory.

2) Let's look at the files we have in the directory.

    ls -l
    
You have quite a few and some of them look very similar. Wouldn't it be nice if there were a way to sort them out based on certain criteria?

3) Let's first try using a wildcard (*) to find all of the files that end with "xml"

    ls *xml
    
This will return a list of all files with names that end in "xml".

Now, try using the wildcard in the middle of a string.

    ls a*txt
    
This returns all the files that have names beginning with 'a' and ending with 'txt', with any number of characters (including 0) between the identified characters.

4) How about using the same string but with a different wildcard (?).

    ls a?txt
    
A little different, right? This is because this wildcard (?) stands in for a single character only. You can match multiple wildcard character by using multiple '?'s, but it will not expand the search beyond the exact number of characters that you define. Be sure that when you use this wildcard only when you are looking to match a filename of an exact length.

5) The [...] construct allows you to indicate a range of characters that you wish to match. First, let's try...

    ls [a-d].txt
    
This defines a range of matching characters. In this instance, any file with a name between a.txt and d.txt will match.

6) Now, combine these different types of wildcards in order to note how they work together.

    ls [a-d]*.txt
    
Notice anything different?

    ls ??test*
    
One more...

    ls [0-9]*
    
7) By now, you can see that using wildcards to match file pathnames (i.e. globbing) is a quick way of exapnding your searching powers beyond known-file searching. There are a few other 'shell-isms' that will be useful when constructing search terms and file paths.

Before starting these steps, let's move into a sub-directory

    cd sub1

Let's try one of the most common directory shortcuts

    ls ../*.*

The '..' indicates that a command should be executed in the parent directory of the current directory. This should be familiar already because it is used to navigate to a parent directory using the 'cd ..' command.

A similar command is the single dot (.) command. 

    ls ./*.*
    
The single dot indicates that a given command should be performed within the current directory. While it may seem that this is redundant, it will become increasingly important as you develop increasingly complex BASH scripts.

Last but not least, let's try the tilde (~) command.

    ls ~/*.*

The tilde is BASH shorthand for a user's home directory.

All three of these directory shortcuts will help you to build better commands in BASH. 

8) One last element that we'll discuss in this exercise is the concept of quoting and escaping. 

Firstly, let's get back up to the exercise3 directory.

    cd ..

Sometimes, you may wish to search on a character that already has a specific meaning in the BASH shell context. For example, let's try...

    ls *!*

This will produce strange results because the exclamation mark (!) is a defined command in BASH. However, we can perform a character-level escape that will allow us to tell the system that we are identifying a character and not a command.

    ls *\!*

Now, we will see a list of all the files that have an exclamation mark in their names.The backslash is very useful, but it can become cumbersome as you have to use it for every character you wish to "escape". This becomes a greater challange the more complex your commands become.

Another approach to recognizing unique characters in strings is the use of quotes. There are two types of quotes: weak ("") and strong ('').

A quick example of how the two differ is to try out the following two commands:

    echo "Your shell is: $SHELL"
    echo 'Your shell is: $SHELL'
    
Let's review a little of what makes these two types of quotes so different.

According to wiki.bash-hackers.org, there is no special interpretation for the following elements if included within weak quotes (""):

        -spaces as word-separators

        -single-quotes used to introduce strong-quoting

        -characters for pattern matching

        -pathname expansions

        -process substitution

Aside from these specifics, all other BASH functions are interpreted and performed.

On the other hand, strong quotes ('') interpret nothing. System commands, variables, and such are taken as literal characters. The one instance in which this is an issue is if you include an apostrophe in a string as BASH interprets this as the close of the strong quote. For example:

    echo 'here's my test'

This will not work correctly as the system will interpret the apostrophe as the close of the strong quote and the quote at the end of the line is the opening of a new quote.

