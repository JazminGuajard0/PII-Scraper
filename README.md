# PII Scraper

A bash script that obtains personally identifiable information (PII) by searching through an entire filesystem.

## Description

The bash script uses regex to find the matching syntaxes such as "username:password" and emails. It also has the capibility to find data that matches he syntaxes with different file extensions such as .json, .yaml, .sh, .config, .config.old, .ini and .xmli.

## nova.sh

This bash script is able to pull any data that matches the "username:password" syntax, including those files that have differnt file extensions rather than just .txt. The only issue is that it also pulls extra data that is not necessary, or does not contain relevant information.

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

This bash script pulls data that matches the "username:password" syntax, but does not have the ability to obtain from different file extensions. In other words, it is only limited to pulling data that matches the regex but also only considers .txt files.

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

### Dependencies

* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* ex. Windows 10

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Jazmin Guajardo  

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
