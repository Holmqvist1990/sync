# sync!

Git sync tool.

Adds all modified files, commits with message `sync auto-commit: [n]`
(where n is the nth+1 commit in log) and pushes to main.

## Usage

Install:
```
$ make install
crystal build --release src/main.cr
sudo mv main /usr/bin/sync
[sudo] password for user:
Installed crocs OK.
```
