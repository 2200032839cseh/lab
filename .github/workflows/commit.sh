
#!/bin/bash

DIRECTORY_TO_WATCH="."  # Change this to your directory path if needed
COMMIT_MESSAGE="Auto-commit: Changes detected"

inotifywait -m -r -e modify,create,delete,move "$DIRECTORY_TO_WATCH" |
while read -r path action file; do
    echo "Detected $action in $file. Running git add and commit."
    git add .
    git commit -m "$COMMIT_MESSAGE"
done
