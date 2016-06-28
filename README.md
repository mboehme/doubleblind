#Features
* Automatically crawls DBLP to find co-authors of the PC members from the last 5 years. 
* Automatically crawls DBLP to generate a superset of conference submitters by adding the set of authors who published in the same conference in the previous year.
* Generates a list of potential and definite conflicts for each PC member.
* Copy-paste the existing questionnaire template for each PC member to mark conflicts-of-interest.

#Steps
1. Find *definite* conflicts of PC members (co-authors of last 5 years)
  1. Adapt `pc.txt` and paste the names of your PC members.
  2. Resolve name ambiguities by adding the DBLP account number, e.g., Christian Hammer 0001. Otherwise, the reported set of co-authors will be a superset of the actual co-authors.
  3. Open a terminal (Linux OS or Mac) and execute `./conflicts.sh`
2. Generate *potential* conflicts. This is done after the submission deadline and generates a superset of submitters to the current conference and authors of papers submitted to the conference in the previous year.
  1. Download `authors.csv` from Easychair to get the submitters to the current conference.
  2. Open a terminal (Linux OS or Mac) and execute `./submitters.sh ISSTA 2015`
3. Generate a COI questionaire for each PC member individually.
  1. Step #2 generates a list of potential and definite conflicts for each PC member. Entries starting with a star (*) are definite conflicts.
  2. Copy the template questionaire
    1. copy [this](https://docs.google.com/spreadsheets/d/1n_tYRtToanGH0DG_hN24I0MPgSX-rek2lfqhTqDZ99E/edit?usp=sharing) spreadsheet to your Google Drive `File -> Make a Copy ..`,
    2. copy the corresponding form template: `Click Form -> Edit Form`,
    3. *for each PC member* copy the form template and `File -> Make a Copy ..`, and
      1. change the name,
      2. copy-paste the potential conflicts from Step #2 in the checkbox field and 
      3. copy-paste the definite conflicts from Step #2 (starting with *) in the text field below.
  

#Noteworthy
* Easychair now automatically detects institutional conflicts.

#Prerequisites
Requires `curl` and `xpath`. On Ubuntu, execute
```
sudo apt-get install curl
sudo apt-get install xpath
```
