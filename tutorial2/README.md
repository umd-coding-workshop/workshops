# Running Commands

## Input and Output (I/O)

By default, Unix programs read input from the keyboard,
and produce output (both regular output and error messages)
onto the screen. These three streams are called **standard
input** (STDIN), **standard output** (STDOUT), and
**standard error** (STDERR).

## I/O redirection

Sometimes, instead of reading from the keyboard or sending output to the screen, you want to read from or write to a file. To do this, you use **input/output redirection**.

### Input Redirection

To tell a command to read from a file instead of from the keyboard, enter a `<` followed by the filename:

```
wc <README.md
```

The redirection operator can go before the command, too:

```
<README.md wc
```

### Output Redirection

To tell a command to write to a file instead of displaying its output to the screen, enter a `>` followed by the filename:

```
ls >directory.txt
```

To confirm that the `ls` command really wrote to the file, run:

```
cat directory.txt
```

The `>` output redirection operator overwrites the contents of the output file every time you use it. If you want to append to a file instead of overwriting, use `>>` instead:

```
pwd >status.txt
date >>status.txt
```

This sequence of commands first writes the current working directory path to the file `status.txt`, then appends the current date and time to that file.

### Error Redirection

Earlier we said there were two output streams, STDOUT and STDERR. By default, they both go to the screen, so it can be hard to tell them apart when you are just running commands in the console. But they are used for two different purposes, and having them be separate turns out to be very useful.

STDOUT is used for normal output of a command: the list of files returned by `ls`, the count of words returned by `wc`, or the list of matching lines returned by `grep` are all instances of data that is written to STDOUT.

STDERR is used for warnings, errors, diagnostic messages, and any other output that isn't strictly part of the expected output of running the command normally with normal data.

You can also redirect STDERR to a file, and it can be a separate file from where you redirect STDOUT. The redirection operator for STDERR is `2>`.

First try to view a non-existant file:

```
cat nothere.txt
```

You will see an error message complaining about the fact that `nothere.txt` does not exist. Now try the same command, but redirect STDERR:

```
cat nothere.txt 2>errors.txt
```

Now there is nothing sent to the screen, and the `errors.txt` file will contain the error message instead:

```
cat errors.txt
```

<!-- sidebar on what the `2` means: file descriptor number -->

## Running Multiple Commands (;)

The appending output redirection exercise demonstrates that often, you want to run multiple commands one after another. There are several ways to do this, depending on what you are trying to do. The simplest way is to just type in each command and hit `[Enter]` one after another, as you have been doing so far in this workshop.

However, you can also put multiple commands on a single line if you separate them by semicolons. For example, we could run the last exercise like this:

```
pwd >status.txt; date >>status.txt
```

## "Short-circuit" Operators (`&&` and `||`)

If you have a command that you only want to run if a previous command succeeded (or failed), you place the **"short-circuit" operators** between the commands.

### Short-circuit "and": `&&`

If you only want to run the second command if the first command succeeds, use the "and" operator: `&&`.

For example, suppose you have a large file or set of files you want to copy and then do some processing. But you only want to start processing the files if you are sure that the copy
command succeeded. This is a perfect opportunity to use the short-circuit and operator:

```
cp badfile.txt newfile.txt && wc <newfile.txt
```

Note in this example we are using a file we know doesn't exist (`badfile.txt`) to simulate a copy operation that fails, and our old friend `wc` is standing in for our processing operation.

### Short-circuit "or": `||`

If you have a sequence of alternative commands and only want to try running them until you get to one that works, use the "or" operator: `||`.

This is a much less common occurance than the `&&`, but it still comes up.

```
wc <badfile.txt >count.txt || echo "Failed!"
```

## Pipes

Suppose you have one command that writes some output that you want another command to read. For instance, counting files in a directory. Since `ls` doesn't have an option to count files, you need to use another program to do the counting. In this case, `wc` ("word count") is appropriate, since it has an option (`-l`) that counts lines instead of words.

But how do you get the output from `ls` to `wc -l`? You could use output redirection and write to a file, then read from that file:

```
ls >listing.txt
wc -l <listing.txt
```

However, now you have the `listing.txt` file hanging around. For quick questions like "How many files are in this directory?" you don't really want to bother with temporary files like this.

Unix handles this extremely common case with a constructy called a **pipe**. A pipe connects one command's STDOUT to another command's STDIN. Therefore, we can actually count files in a directory like this:

```
ls | wc -l
```

You can connect as many commands with pipes as you want:

```
ls | grep 'txt' | wc -l
```

You can also continue to use input and output redirection on the beginning and end of the sequence of commands:

```
ls | grep 'txt' | wc -l >count.txt
<listing.txt grep 'txt' | wc -l
<listing.txt grep 'txt' | wc -l >count.txt
```

### Fun with Pipes: `cowsay`

[TODO: cowsay diversion]

## `for` Loops and Variables

Sometimes you want to repeat a command. Often, you will have a command, or commonly a series of commands, that you want to run on lots of files. The way to do this is with a **for loop**. This will also introduce us to the concept of **variables**

```
for f in README.md listing.txt status.txt; do wc -l <"$f"; done
```

This runs the command `wc -l` three times, and each time replaces the `$f` with the next name from the list `README.md`, `listing.txt`, `status.txt`. The `$f` is a **variable**. When you define a variable in Bash, you omit the leading `$`, but everywhere you use it you must include the `$`.

Variable names are really for your benefit; the shell does not care. If you just running quick, one-off commands at the command line, single letter variables that are easy to type are fine. However, once you get into writing scripts, you will find that using longer, more expressive variable names will help you understand your code.

## Command Substitution

Suppose you don't know ahead of time what your list of files is, or you do but it is very long and you would rather not type it all out. You can use **command substitution** to use the output of another command to generate the list of files:

```
for f in $(find -name '*.txt'); do wc -l <"$f"; done
```

The command substitution is indicated by the `$(`...`)` construct. Bash runs the command inside the parentheses and then replaces the whole `$(`...`)` construct with the data returned from the command, just as if you'd typed it in yourself.

## `while` Loops

Sometimes, instead having a list of files or other fixed number of times you would like to repeat a series of commands, you want to repeat a command until some condition is met. To do this, you use a **while loop**.

A common use for a while loop is to read a file line by line and do something to each line one at a time. For example, to read a text file and prepend something to the beginning of each line, we can use the `read` command in a while loop. Since `read` reads from STDIN by default (like a good Unix citizen), we will add input redirection to tell it to read from a file instead.

```
while read line; do echo "=== $line"; done <README.md
```

The argument to `read` is the name of the variable we want to use to store the value that it reads. In this case we are using `line`.

Note that the input redirection to read from the *README.md* file comes at the end of the loop construct. This is because the file is the input to the entire loop. If instead we made the file the input to the `read` command, then the loop would repeat forever, just reading the first line of the file.
