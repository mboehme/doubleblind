*Automatically crawls DBLP to find co-authors of the PC from the last 5 years.*

#Steps
1. Adapt pc.txt and paste the names of your PC members. 
2. Resolve name ambiguities by adding the DBLP account number, e.g., Christian Hammer 0001. Otherwise, the reported set of co-authors will be a superset of the actual co-authors.
3. To find conflicts of your PC members, open a terminal (Linux OS or Mac) and execute `./conflicts.sh`
4. To generate a superset of submitters to your conference, execute `./submitters.sh`

#Prerequisites
Requires `curl` and `xpath`. On Ubuntu, execute
```
sudo apt-get install curl
sudo apt-get install xpath
```
