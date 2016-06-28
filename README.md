*Automatically crawls DBLP to find co-authors of the PC from the last 5 years.*

#Steps
1. Find *definite* conflicts of PC members (co-authors of last 5 years)
  1. Adapt pc.txt and paste the names of your PC members.
  2. Resolve name ambiguities by adding the DBLP account number, e.g., Christian Hammer 0001. Otherwise, the reported set of co-authors will be a superset of the actual co-authors.
  3. Open a terminal (Linux OS or Mac) and execute `./conflicts.sh`
2. Generate *potential* conflicts. This is done after the submission deadline and generates a superset of submitters to the current conference and authors of papers submitted to the conference in the previous year.
  1. Download `authors.csv` from Easychair to get the submitters to the current conference.
  2. Open a terminal (Linux OS or Mac) and execute `./submitters.sh ISSTA 2015`
3. Generate a COI questionaire for each PC member individually.
  1. PC members should tick all potential conflicts (from Step 2).
  2. You already ticked definite conflicts (from Step 1).

#Noteworthy
* Easychair now automatically detects institutional conflicts.

#Prerequisites
Requires `curl` and `xpath`. On Ubuntu, execute
```
sudo apt-get install curl
sudo apt-get install xpath
```
