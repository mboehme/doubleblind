#Double Blind Conflicts-Of-Interest Identification
The following scripts were used to identify conflicts of interest during the first double blind review at the International Symposium on Software Testing and Analysis (ISSTA) in 2016. [More info ...](https://issta2016.cispa.saarland/interview-with-abhik-roychoudhury-issta-2016-program-chair/)

#Features
* Automatically crawls DBLP to find co-authors of the PC members from the last 5 years. 
* Automatically crawls DBLP to generate a superset of conference submitters by adding the set of authors who published in the same conference in the previous year.
* Generates a list of potential and definite conflicts for each PC member.
* Copy-paste the existing questionnaire template for each PC member to mark conflicts-of-interest.
* Works for Easychair supported conferences.


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
    1. Request access to the template Google Form [here](https://docs.google.com/forms/d/1B-GXugFH1923Ofzjmd-AQupMayL7rp7BwB6NPiwTTxA/edit?usp=sharing)
    2. copy and open the form *template*: `File -> Make a Copy ..`,
    3. *for each PC member* copy the form template and `File -> Make a Copy ..`, and
      1. change the author name,
      2. copy-paste the potential conflicts from Step #2 in the checkbox field and 
      3. copy-paste the definite conflicts from Step #2 (starting with *) in the text field below.
  

#Noteworthy
* Easychair now automatically detects institutional conflicts.
* For the PC meeting, you might want to consider Alex Orso's Easychair Slide Generator: https://github.com/alexorso/easychairscripts

#Prerequisites
Requires a Linux Machine (e.g., Ubuntu or Mac OS). Requires`curl` and `xpath`. On Ubuntu, execute
```
sudo apt-get install curl
sudo apt-get install xpath
```

#Acknowledgements
Scripts have been created by Marcel Böhme. This work is licensed under a Creative Commons Attribution 3.0 Unported License - http://creativecommons.org/licenses/by/3.0/
