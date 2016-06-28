*Automatically crawls DBLP to find co-authors of the PC from the last 5 years.*

#Steps
1. Adapt pc.txt to paste the names of your PC members. Resolve name ambiguities by adding the DBLP account number, e.g., Christian Hammer 0001.
2. Open a terminal and execute `script.sh` (Linux OS or Mac).
```
./script.sh
```

#Prerequisites
Requires `curl` and `xpath`. On Ubuntu, execute
```
sudo apt-get install curl
sudo apt-get install xpath
```
