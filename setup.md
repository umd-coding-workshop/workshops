# How to use these materials

## File Structure

These materials are designed to be used while at the command prompt in a Bash shell environment.  They are organized into three tutorials, corresponding to three planned workshops, with each tutorial divided into several exercises covering a more or less coherent set of activities relating to some aspect of scripting in Bash.  The tutorials are designed to build on one another, so it is recommended that you proceed in order. For each tutorial there is a folder, and inside the tutorial folder there is another folder for each exercise. The README.md file in each tutorial/exercise folder provides the instructions on how to proceed through the individual tasks. The other files in the folder are used to complete tasks in the exercises.

## Using the README.md Files

If you are viewing these materials on Github, you'll notice that when you are viewing a particular folder, Github displays the README file for that folder automatically.  One of the advantages of working in Cloud 9 (on which see below), is that Cloud 9 allows you to view the README file in one region of the browser window, while having a terminal open to do the exercises in another region of the browser window.  If you are working in a local environment you can open the README in a text editor and have a terminal open next to it to perform the tasks, or view the online version of the README in your web browser as you work through the tasks in a terminal session.

## Getting Bash

For Mac and Linux users, a Bash environment is available simply by opening the terminal application (the terminal will probably default to Bash, though it depends a bit on your particular OS/distribution).  On Windows the situation is more difficult, though Windows 10 now includes a Bash environment, so things seem to be getting somewhat more convenient on the Windows side too (https://msdn.microsoft.com/en-us/commandline/wsl/about).  For older versions of Windows, you have to install an application such as Cygwin (http://www.cygwin.com) which emulates the Bash environment.

## Setting Up Cloud 9

For this workshop, to get around the issues with the environment, we are using the Cloud 9 cloud programming environment instead.  We'll walk through getting set up on Cloud 9 at the beginning of the workshop.  Unfortunately, as we discovered in our first meeting, Cloud 9 recently started requiring a credit card number (for identity verificationonly; it will not be charged) when you create a free account, so if you are on Windows and choose not to give Cloud 9 your credit card info, Cygwin is probably your best option.

## Cloning this Repository

Once you have a working Bash environment (either in the Cloud or on your local machine), you'll need to clone this repository to have the files available for the exercises. Navigate through your shell environment to a location where you would like to store the files and type the following command to clone this repository.

    git clone https://github.com/umd-coding-workshop/workshops

This command assumes you have git installed in your environment and that you are able to move to an appropriate directory in your command line interface. If that's not the case, please contact one of the members of the Libraries' Coding Workshop and we'll help you get started.
