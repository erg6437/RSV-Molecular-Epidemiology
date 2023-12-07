# Altered RSV Epidemiology and Genetic Diversity Following the COVID-19 Pandemic
Estefany Rios-Guzman, Lacy M. Simons, Taylor J. Dean, Francesca Agnes, Anna Pawlowski, Arghavan Alisoltani, Hannah H. Nam, Michael G. Ison, Egon A. Ozer, Ramon Lorenzo-Redondo, & Judd F. Hultquist
# Table of Contents 
* [Introduction](#Introduction)
* [Significance and Findings](#Significance-and-Findings)
* [Study Design](#Study-Design)  
* [Dependencies](#Dependencies)
* [Epidemiological Data Sets](#Epidemiological-Data-Sets)
* [Phylogenetic Data Sets](#Phylogenetic-Data-Sets)
* [Phylogenetic Analysis](#Phylogenetic-Analysis)

# Introduction #
This repository was curated to store scripts needed to generate both main and supplementary figures in Rios-Guzman et. al. 2023 (unpublished). The following data* are provided:

1. Citywide and National epidemiological data (case counts, detections, percent positivity, etc.) are provided in the Data folder.
    
2. NCBI Accession IDs for sequences used for phylogenetic and phylodynamic analysis

3. Output files for HyPhy Mixed Effects Model of Evolution (MEME) and A Fast, Unconstrained Bayesian AppRoximation for Inferring Selection (FUBAR)
   
4. Codes (.ipynb & .r) used for the analysis of the aforementioned data sets
   
Note: Clinical metadata and demographic information used for analysis and generated figures are not provided as per IRB constraints

# Significance and Findings #

* Shifts in diagnostic testing to rapid test use and to capture SARS-CoV-2 infection after 2020 contributed to increased outpatient encounters
  
* Genomic surveillance and paired clinical data reveal a statistically significant association between RSV-A infections and ICU admission
  
* We identified a predominant monophyletic RSV-B cluster post-implementation of COVID-19-related nonpharmaceutical interventions (NPIs) which contains mutations with the potential to confer resistance to monoclonal antibody therapeutic Nirsevimab

# Study Design

Through a single center retrospective cohort study, we examined the RSV genetic diversity over a 14-year period in Chicago, Illinois, USA. Between 2009 to 2023, clinical metadata of 8,516 patient encounters were captured through Northwestern Medicine's Electronic Data Warehouse (EDW) repository. From 2017 to December 30th 2022, 551 residual diagnostic swabs were collected from RSV-positive patients, of which 220 were successfully utilized for RSV whole-genome sequencing.

# Dependencies
### Python Dependencies
* Pandas
* Numpy
* matplotlib
* seaborn
* tableone
* datetime
* bio
* scipy
* lifelines

### R Dependecies 
* tabplot
* readxl
* dplyr
* lubridate
* ggplot2
* tidyr
* ggsci
* ggpubr
* FastaUtils
* ape
* TreeTools
* phylotools
* gtsummary
* MASS
* car
* gt
* OddsPlotty
* effects

# Epidemiological Data Sets #
### Figure 1A
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig-1-NREVSS-2010-2020.csv"> CDC (NREVSS) National RSV Epidemiology Dataset [July 2010 - June 2020] </a> 


<a href=""> CDC (NREVSS) National RSV Epidemiology Dataset [June 2020 - May 2023] </a> 

### Supplementary Figure 1A
<a href=""> CDC (NREVSS) HHS Region 5 RSV Epidemiology Dataset [June 2020 - March 2023] </a> 

### Figure 1B
<a href="">Chicago Department of Public Health (CDPH) Weely Aggregated Respiratory Virus Data </a> 

### Figure 5
<a href=""> RSV-B 1957 - 2023 Fusion MEME data </a> 

<a href=""> RSV-B 1957 - 2023 Fusion FUBAR data </a> 

<a href=""> RSV-B 2018 - 2023 Fusion MEME data </a> 

<a href=""> RSV-B 2018 - 2023 Fusion FUBAR data </a> 

<a href=""> Binding site locations - Palivizumab </a> 

### Supplementary Figure 6 

<a href=""> Binding site locations - Nirsevimab </a> 

<a href=""> Binding site locations - Clesrovimab </a> 

<a href=""> Binding site locations - Suptavumab </a> 


### Supplementary Figure 5
<a href=""> RSV-B M2-1 MEME data </a> 

<a href=""> RSV-B M2-2 MEME data </a> 

<a href=""> RSV-B Attachment Glycoprotein (G) MEME data</a> 

<a href=""> RSV-B Attachment Polymerase (L) MEME data </a> 

# Phylogenetic Data Sets #
<a href=""> USA RSV-A NCBI WGS Information </a> 

<a href=""> Global RSV-A NCBI WGS Information </a> 

<a href=""> USA RSV- NCBI WGS Information </a> 

<a href=""> Global RSV-B NCBI WGS Information </a> 

<a href=""> Global RSV-B NCBI Fusion Information </a> 

<a href=""> Global RSV-B NCBI Attachment Glycoprotein (G) Information </a> 


# Phylogenetic Analysis
### Alignment
```
mafft --auto --thread -auto XXX.fasta > XXX.mafft.fa
```

### Maximum Likelihood (ML) Phylogenetic Construction (IQTree2)

```
iqtree2 --alrt 1000 --B 1000 --s XXX.mafft.fa
```

### Temporal ML Phylogenetic Construction (with Coalescent)
```
treetime --aln alignment.file.mafft.fa --tree treefile.nwk --dates datefile.csv -outdir /path/to/output/directory --coalescent skyline --max-iter 10
```

### Mugration
```
treetime mugration --tree 080723-GISAID_col-BOL.mafft.fa.treefile --states 080823-bolivia-only-metadata.csv --attribute location
```




