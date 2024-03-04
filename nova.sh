#!/bin/bash

#The path of the directory that it is searching from
directory="path/to/search"
pattern='*[a-zA-Z0-9_]+:*[a-zA-Z0-9_]$'

#Regex pattern to search for
find "$directory" -type f -print0 | while IFS= read -r -d '' file; do
        if [ -f "$file" ]; then
                  grep -E -H "$pattern" "$file"
done
