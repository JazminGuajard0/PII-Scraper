![PII_Scraper](https://github.com/JazminGuajard0/PII-Scraper/assets/71527158/04feb28e-a7be-4546-a014-9b428b65f7c4)

`PII Scraper` is a bash script that obtains personally identifiable information (PII) by searching through an entire filesystem.

## Description

The bash script uses regex to find the matching syntaxes such as "username:password" and emails. It also has the capibility to find data that matches he syntaxes with different file extensions such as .json, .yaml, .sh, .config, .config.old, .ini and .xmli.

## nova.sh

This bash script is able to pull any data that matches the "username:password" syntax, including those files that have differnt file extensions rather than just .txt. 

Issue: It pulls extra data that is not necessary, or does not contain relevant information.

```sh
#!/bin/bash

#The path of the directory that it is searching from
directory="path/to/search"

#Regex for "username:password"
pattern='*[a-zA-Z0-9_]+:*[a-zA-Z0-9_]$'

#Regex pattern to search for
find "$directory" -type f -print0 | while IFS= read -r -d '' file; do
        if [ -f "$file" ]; then
                  grep -E -H "$pattern" "$file"
done
```

## pii.sh

This bash script pulls data that matches the "username:password" syntax in the directory, and subdirectories. 

Issue: It only pulls data from .txt files that match the regex for "username:password".

```sh
#!/bin/bash

#The path of the directory that it is searching from
path="path/to/search"

#Regex pattern that looks for 'username:password'
command="find $path -type f -exec grep -a -E '^[a-zA-Z0-9_]+:[a-zA-Z0-9_]+$' {} \; -print"

#Regex pattern that looks for emails
command="find $path -type f -exec grep -a -E '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' {} \; -print"

#Echoes the two commands from above
echo "$command"

#Executes the two commands
eval "$command"
```


## Getting Started

### Executing program

How to run the program
* Once the bash script you choose is saved, and edited to the directory you want to search in you can execute it.
```sh
./nova.sh
```
or
```sh
./pii.sh
```

## Authors

Jazmin Guajardo  

## Acknowledgments

Inspiration, code snippets, etc.
* [LinPEAS](https://github.com/carlospolop/PEASS-ng/tree/aee8acf60f88e789fb1311a4ddd91b83b421eb3c/linPEAS)
* [What is Regex?](https://www.computerhope.com/jargon/r/regex.htm)
* [Shell Scripting Guide to Regex](https://ioflood.com/blog/bash-regex/)
* [Regex Patterns](https://www.tutorialsteacher.com/regex/frequently-used-regex-patterns)
* [Username and Password Validation using Regex](https://dev.to/fromwentzitcame/username-and-password-validation-using-regex-2175)
* [Loop through files in a Directory in Bash](https://www.warp.dev/terminus/bash-loop-through-files-in-directory)
* [Searching for keyword in a directory](https://unix.stackexchange.com/questions/21169/how-to-search-for-a-word-in-entire-content-of-a-directory-in-linux)
