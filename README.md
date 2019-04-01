## Accessing the NYBG Virtual Herbarium

The New York Botanical Garden has a tremendous database of specimens available online.  Why not access this data into R for easy data analysis?  The 
raw data is available in a 2+ gigabyte text file -- not ideal for analysis.  Running the R script `NBYG.R` allows you to input subsets of the NYBG collection data directly into R as a data fram, provided the database text file 
(`occurence.txt`) is located in your working directory.

### The data

The text file with the raw database information can be downloaded from the
[Global Biodiversity Information Facility (GBIF)](https://www.gbif.org/dataset/d415c253-4d61-4459-9d25-4015b9084fb0)  You need this data first!  Again, be forewarned: it's 2+ gigabytes in size.  NYBG has a prodigious collection!

### The program

Run the R script: `source("NYBG.R")` to create a function `NYBG`.  This function takes two arguments; the number of specimens from the database to read, and which specimen to begin
from.  For example, `NYBG(100, 200)->dat`  would read 100 specimens from the database, starting with the 200th database entry, and save the information
as a data frame 'dat' in R.

Note that some entries in the database have 'blocks' of text, where dozens or more entries are mistakenly crammed into one single entry.  So, in
reality, `NYBG(100,200)` might end up taking 100+ specimens from the database.

### What's next

I have a hunch that I might be able to use the `awk` utility to allow for more powerful searching of this data.  I'm just getting set up with with `auk` package to access [eBird](https://ebird.org/home) data; as I gain familiarity with that, I'll consider if some of that functionality might serve for this dataset.


