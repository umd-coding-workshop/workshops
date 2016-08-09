We've gotten a lot more familiar with moving around in a BASH shell environment. Now, we're going to learn a bit about how BASH allows you to use globbing, quoting, and escaping to more efficiently find resourcesin your system.

1) First things first, let's make sure we're in the right directory.

    pwd
    
You should be in the exercise3 directory.

2) Let's look at the files we have in the directory.

    ls -l
    
You have quite a few and some of them look very similar. Wouldn't it be nice if there were a way to sort them out based on certain criteria?

3) Let's first try using a wildcard (*).

    ls *xml



globbing (and other special shell-isms like ., .., and ~)
quoting/escaping (single vs. double, interactions with globbing)
