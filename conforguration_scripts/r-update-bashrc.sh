#!/bin/bash
if ! [[ ":$PATH:" == *":/usr/local/src/R:"* ]]; then
  echo 'Adding /usr/local/src/R to $PATH'
  echo '# Running R from source in /usr/local/src/R' >> ~/.bashrc
  echo 'PATH=$PATH:/usr/local/src/R' >> ~/.bashrc
else
  echo "/usr/local/src/R is already in $PATH"
fi
