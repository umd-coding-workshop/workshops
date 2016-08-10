We've gotten a lot more familiar with moving around in a BASH shell environment. Now, we're going to learn a bit about how BASH allows you to use globbing, quoting, and escaping to more efficiently find resourcesin your system.

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
    
This returns all the files that have any characters between the identified characters.

4) How about using the same string but with a different wildcard (?).

    ls a?txt
    
A little different, right? This is because this wildcard (?) represents a single character variable. You can search for multiple variables by using multiple wildcards (?), but it will not expand the search beyond the exact number of characters that you define. Be sure that when you use this wildcard only when you are looking for an exact number of variables.

5) The [...] varible allows you to define a range of characters that you wish to be returned. First, let's try...

    ls [a-d].txt
    
This defines a range of acceptable variables. In this instance, any file between a.txt and d.txt will be returned.

6) Now, combine these different types of wildcards in order to note how they interact as a group.

    ls [a-d]*.txt
    
Notice anything different?

    ls ??test*
    
One more...

    ls [0-9]*



globbing (and other special shell-isms like ., .., and ~)
quoting/escaping (single vs. double, interactions with globbing)
