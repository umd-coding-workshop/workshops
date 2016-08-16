# File content creation and access

The first three exercises in this tutorial have focused on navigating the shell environment and manipulating directories and files as objects within that environment. Now it is time to explore some of the tools for working directly with the contents of files.

## 1. Slicing and joining files (split and cat)

cat is short for concatenate, and as the name suggests, its original intent was to allow you an easy way of joining two files.  To demonstrate, we will experiment with another commnand, with some opposite effects, namely split.  If you are not already, go into the exercise4 directory and list the files

    cd exercise4
    ls 
  
Among the available files in this directory is a Shakespearean sonnet.  We will now use the split command to divide it into 4-line pieces:

    split -l 4 sonnet15.txt
  
The "-l 4" tells split to divide the file into as many 4-line sections as needed to accommodate the contents of the file.  Now list the files in the directory and you'll notice some new ones, starting with 'x'.  You'll notice that these files follow a two-character alphabetical ordering sequence.  This is the default behvior of split, and can be controlled by various parameters.

But the point here is really not to illustrate the features of the split command, but rather to demonstrate how cat can be used to join files.  Cat takes all the files passed to it as arguments, joins them together in alphabetical order by filename, and prints the resulting datastream to the standard ouput (the screen).

    cat xaa xab

You'll see the first half of our sonnet.  But there's an easier way to join all the files that split created without typing all their names one by one (imagine how inconvenient that would be if there were 50 files, for example).  Instead of typing all the filenames you can simply use globbing like this:

    cat x*
  
This command says conCATenate all the files in the current directory whose names begin with x.  As you can see, it has restored our Sonnet to its original form. This function is where cat gets its name, but there is another way cat is commonly used, namely to simply print the contents of a file to the screen for easy reference:

    cat sonnet15.txt
  
As you can probably imagine, there are many other ways to look at files.  Cat is fine for a short poem, or for kicking off a pipeline (more about that below), but it's not so great for reading a long file, because the output tends to go by too fast, leaving you scrolling back up in your terminal to see what you missed.

    cat hamlet1-5.txt
  
## 2. Showing contents of files (more and less)

Did you catch all of that?  The whole scene from Hamlet went past in a fraction of a second.  Isn't there a more convenient utility for reading.  Of course there is.

    more hamlet1-5.txt

The 'more' command paginates your file for easy reading, and let's you page through by hitting space (hit single arrow keys to move up and down, or q to break out).  Another similar command is 'less' which (so the story goes) was named as a pun on 'more' (i.e. less is more).  You can explore less and more with their respective manual pages (man less, man more).

## 3. Displaying parts of files (head and tail)

But what if you don't want to walk through the whole file, but just want to see the beginning of it, to get an idea of what's it contains?  For that you can use 'head'. For example, let's say you've got a file called 'poe' and you just want to know which work of the 'divine Edgar' it contains:

    head -n5 poe.txt

You should have seen the poem's title, author, and opening lines.  As a review of a previous lesson's materials, why not take the oppotunity to give this file a more descriptive name:

    mv poe.txt raven.txt

As you might have already guessed by now, if we have a 'head' command there's also likely going to be a 'tail' command to see the end of the file (I guess maybe for those Agatha Christie fans who can't wait to find out who done it.

    tail raven.txt
  
As you can see, here we've left out the '-n' argument that can be used to specify how much of the file to display.  Rather than produce an error, the tail command simply defaults to a set number of lines (which happens to be 10).

## 4. Counting parts of files (wc and wc -l, and pipes)

What if we needed to know how long a file is, in order to estimate how many lines to see with our head or tail commands?  There is an easy way to do that with the wc command.  

    wc raven.txt
  
Hmmm.  What are those three numbers?  None of them looks like a line count for the Raven.  You can explore the command for yourself with "man wc" but for now it is sufficient to know that wc gives by default the length of the file in bytes, words, and characters.  To get the number of lines, you must specify the -l parameter like this:

    wc -l raven.txt
  
Neat, huh?  There's a very useful pattern that can serve here as a good demo of wc and a preview of something really nifty that will be covered in a more advanced workshop, namely the ability to connect multiple commands into what are called 'pipelines'.  A very common pipeline is to attach the "wc -l" command to the end of any sort of process that produces line-oriented results, as a way of getting a result count.  For example, if we wanted to know how many lines were coming back from the tail command we did earlier (assuming for the moment that we didn't know tail defaults to 10 lines):

    tail raven.txt | wc -l
  
As you can see, we've simply run the tail without parameters and then attached a vertical pipe character (remember we are building a pipeline) followed by the wc -l command.  Now the wc -l doesn't apply to the whole raven.txt file in this case, but only to the portion that came through the pipeline from the tail command (in this case 10 lines).

## 5. Finding and filtering (grep)

So we've seen how to look at files and measure them in certain ways but what if we need to filter them or find things really large files?  For that there are several powerful tools at our disposal, and we'll use this idea of pipelines to demonstrate one of them, the gnu regular expression processor, or grep.

Let's say you're playing Rosencrantz in the upcoming production of Hamlet, and you're trying to learn your lines, but you'd really like to focus in on just your bits, and not be distracted by Hamlet's long soliloquies.  First you might try:

    cat hamlet2-2.txt

But that's gives you too much information.  Instead you can combine the same command with a pipeline to grep to find just your lines.

    cat hamlet2-2.txt | grep Rosencrantz
  
That seems pretty good, but what exactly is this output?  Cat has sent the entire contents of act 2, scene 2 to the standard output, which is normally the screen.  But the pipe redirects that output instead to the next command in the pipeline, namely grep.  Grep then takes the incoming lines and searches them for the specified search string, "Rosencrantz".  It filters out lines that do not contain that string (i.e. lines that don't match the specified 'expression' or 'pattern'), and prints only those that match.

As you can see most, but not all, of these matches are Rosenctrantz's lines, thanks to the speaker cues in the original text.  We can try to filter the one line of Hamlet's that happened to match our pattern -- "Rosencrantz! Good lads, how do ye both?" -- with the following pipeline by specifying that grep should match only the name followed by a period:

    cat hamlet2-2.txt | grep Rosencrantz.
  
Hmm. That didn't work. Why did the line beginning with "Rosencrantz!" still match our pattern?  The answer is that '.' has a special meaning in the grep syntax, namely matching any character.  So the dot special character in our regular expression actually matches both a period and an exclamation point (and spaces or any other character for that matter).  So how can we indicate that we want to match only an actual period?  The answer is by using escaping:

    cat hamlet2-2.txt | grep Rosencrantz\\.
  
The double backslash tells grep to treat the period literally, so now it only matches the lines beginning with Rosencrantz's speaker cue. Now what if you wanted to sort all those lines, perhaps in order to create an index to the speeches of your character? For that you would just add one more segment to your pipeline:

    cat hamlet2-2.txt | grep Rosencrantz\\. | sort
  
Now we're getting back only Rosencrantz's lines, sorted alphabetically.  It is not all of this character's dialogue, but rather only the first line of each speech. There are ways to construct grep expressions that will retrieve all lines (by utilizing the trailing blank line that marks a change in speaker), but that is a sufficently complicated task that is better left aside for now.  Suffice it to say that we've only barely scratched the surface of the many things you can do with grep.

## 6. File Editors 

The final topic for this exercise is to introduce two of the possible editor programs that you might choose to use to edit files in the terminal. The first one will be familar to anyone who ever used a command-line emial interface such as Pine. 

    nano hamlet1-5.txt

Nano is a fairly easy to use editor becuase the special commands are displayed conveniently at the bottom of the screen.  To get out of this interface, type control-x and discard any changes.

The other editor, while more difficult to learn initially, is a favorite among many programmers becuase it allows you to accomplish a lot with very few keystrokes:

    vi hamlet1-5.txt

There have been entire books written on learning vi (short for VIsual editor), so a full introduction is most certainly beyond the scope of this tutorial.  Perhps the key thing to note for those who are new to vi is simply that this editor has two modes, command mode and insert mode.  You switch betweeen them by pushing i to go into insert mode, and escape to go back out.  Explore vi and read more in this tutorial from the University of Washington: http://staff.washington.edu/rells/R110/

## 7. Conclusion 

That's it!  You made it to the end of this first tutorial on the Bash command line.  The key now, to avoid forgetting what you have learned, is to put these skills to use, preferably on a real-world project. 

We hope to run additional tutorials in the near future and hope to see you there!
