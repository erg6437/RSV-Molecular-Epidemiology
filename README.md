![image](https://github.com/erg6437/RSV-Molecular-Epidemiology/assets/53444914/3caa2023-d542-433b-b4b3-f8ea2d4be1b3)


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
* Pandas (v.1.1.3)
* Numpy (v.1.19.2)
* matplotlib (v.3.3.2)
* seaborn (v.0.11.0)
* tableone (v.0.7.12)
* bio (v.1.79)
* scipy (v.1.5.2)
* lifelines (v.0.27.7)

### R Dependecies 
* tabplot
* readxl (v.1.4.3)
* dplyr (v.1.1.2)
* lubridate (v.1.9.2)
* ggplot2 (v.3.4.3)
* tidyr (v.1.3.0)
* ggsci 
* ggpubr
* FastaUtils
* ape (v.5.7-1)
* TreeTools (v.1.10.0)
* phylotools (v.1.9-16)
* gtsummary (v.1.7.2)
* MASS (v.7.3-58.2)
* car 
* gt (v.0.9.0)
* OddsPlotty 
* effectsize (v.0.8.5)

# Epidemiological Data Sets #
### Figure 1A
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig-1-NREVSS-2010-2020.csv"> CDC (NREVSS) National RSV Epidemiology Dataset [July 2010 - June 2020] </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig-1-NREVSS-062020-062021-test-det-pp.zip"> CDC (NREVSS) National RSV Epidemiology Dataset [June 2020 - June 2021] </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig-1-NREVSS-062021-present-test-det-pp.zip"> CDC (NREVSS) National RSV Epidemiology Dataset [June 2021 - March 2023] </a> 

### Figure 1B
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig1-RSVNET-Hospitalization.csv.zip">Chicago Department of Public Health (CDPH) Weekly Aggregated Respiratory Virus Data </a> 

### Figure 5
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-USA.MEME.csv"> RSV-B 1957 - 2023 Fusion MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-USA.MEME.csv"> RSV-B 1957 - 2023 Fusion FUBAR data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-5yr.MEME.csv"> RSV-B 2018 - 2023 Fusion MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-5yr.FUBAR.csv"> RSV-B 2018 - 2023 Fusion FUBAR data </a> 


### Supplementary Figure 5
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/080223-M2-1-MEME.csv"> RSV-B M2-1 MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/080223-M2-2-MEME.csv"> RSV-B M2-2 MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/07192022-G-MEME-RSVB.csv"> RSV-B Attachment Glycoprotein (G) MEME data</a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/080223-L-MEME.csv"> RSV-B Attachment Polymerase (L) MEME data </a> 

# Phylogenetic Data Sets #
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/041223-RSVA-USA-NMH-metadata.csv"> USA RSV-A NCBI WGS Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/041223-RSVA-Global-NMH-metadata-location.csv"> Global RSV-A NCBI WGS Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/041223-RSVB-USA-metadata.csv"> USA RSV-B NCBI WGS Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/102223-RSVB-Global-NMH-metadata-dates%20(2).csv"> Global RSV-B NCBI WGS Information - Dates </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/111623-RSVF_G%202.zip"> Global RSV-B NCBI Fusion Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/111623-RSVF_G%202.zip"> Global RSV-B NCBI Attachment Glycoprotein (G) Information </a> 

# Phylogenetic Analysis
#### Note: the timing to run the phylogenetic analysis is dependent on the number of sequences in the alignment. Run time has varied from 30 minutes to 3 days from alignment to ML phylogenetic construction

### Installing Packages and Activating Environment
```
module load anaconda3
module load gcc/9.2.0
conda create -c bioconda -n environment_for_RSV_analysis mafft=7.490 iqtree2=2.2 treetime=0.8.5 hyphy vigor4
conda activate environment_for_RSV_analysis
```

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

## Mugration Tree Annotation

```
treetime mugration --tree treefile.nwk --states metadata-containing-file.csv --attribute location
```

### Positive Selection (episodic and pervasive)
```
hyphy meme --alignment alignment-file.mafft.fa --tree tree-file.nwk

hyphy fubar --alignment alignment-file.mafft.fa --tree tree-file.nwk
```

### Sequence Annotation Tool - VIGOR (Viral Genome ORF Reader)
```
vigor4 -i /directory/to/alignment/file/alignment-file.mafft.fa -o vigor -d /directory/to/vigor/files/VIGOR_DB-master/Reference_DBs/rsv_db
```

### Positive Selection 
```
hyphy -i meme
hyphy -i fubar
```




