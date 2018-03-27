## Accessing the NYBG Virtual Herbarium

The New York Botanical Garden has a tremendous database of specimens available online.  Why not access this data into R for easy data analysis?  
The raw data is available in a text file; I probably don't have to outline why that's not ideal for analysis.  Running this little R script in your
directory where the database text file ("occurence.txt") is located allows you to input the data directly into R as a data frame.

### The data

The text file with the raw database information can be downloaded from 
[The Global Biodiversity Facility (GBIF)](https://www.gbif.org/dataset/d415c253-4d61-4459-9d25-4015b9084fb0)  You need this data first!

### The program

The R script creates a function 'NYBG' in R that takes two arguments; the number of specimens from the database to read, and which specimen to begin
from.  For example, NYBG(100, 200)->dat  would read 100 specimens from the database, starting with the 200th database entry, and save the information
as a data frame 'dat' in R.

Note that some entries in the database have 'blocks' of text, where dozens or more entries are mistakenly crammed into one single entry.  So, in
reality, NYBG(100,200) might end up taking 100+ specimens from the database.

