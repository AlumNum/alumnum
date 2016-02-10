#Readme
##Git/GitHUb instructions for AlumNum project

## Initial Setup
+ On Github, fork the main repo 
+ Clone the forked repo to your local machine- copy the SSH url (from your forked repo, not the main one!), go to your terminal in a folder that is NOT ALREADY A GIT REPO, type `git clone https://github.com/.........`
+ Copy the SSH URL of the MAIN REPO (not your forked repo)
+ In terminal, type `git remote add upstream [url of main repo]` This will allow you to get new changes by typing `git pull upstream master` (upstream is an arbitrary name, you could call it anything you want but it's nice to have it be the same as what we use for class)

##Pushing up new changes
+ When you have changes ready to commit to the main repo,
+ `git add [files or .]`
+ `git commit -m 'descriptive commit message' `
+ Open the page for the main repo on Github and create a new pull request