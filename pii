#!/bin/bash

#The path of the directory that it is searching from
path="path/to/search"

#Regex pattern that looks for 'username:password'
command="find $path -type f -exec grep -a -E '^[a-zA-Z0-9_]+:[a-zA-Z0-9_]+$' {} \; -print"

#Regex patternt that looks for emails
command="find $path -type f -exec grep -a -E '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' {} \; -print"

#Echoes the two commands from above
echo "$command"

#Executes the two commands
eval "$command"
