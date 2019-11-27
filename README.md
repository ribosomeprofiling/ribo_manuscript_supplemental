# Supplemental Material for "RiboFlow, RiboR and RiboPy: An ecosystem for analyzing ribosome profiling data at read length resolution"

We generated ribo files for three datasets: Cenik et al., Wu et al., and Sidrauski et al.

The ribo files were created using [RiboFlow](https://github.com/ribosomeprofiling/riboflow). 
The parameters files, used for each run, is also provided in this repository in yaml format. 

We provided ribo files with and without coverage data. The ribo files with coverage data contain the additional infomation of total number of mapped reads for each nucleotide position.

The ribo files, for each data set, can be found in the corresponding directories with the name "all.ribo".

Each ribo file in the "experiments" sub-folder is coming from a single experiment. Thus, the combined files, named "all.ribo", are obtained by merging these ribo files into one, using `ribopy merge` (see example below).

## Data Sets

### 1) Cenik et al.

__Publication:__ [Integrative analysis of RNA, translation, and protein levels reveals distinct regulatory variation across, Cenik et al., Genome Research, 2015](https://genome.cshlp.org/content/25/11/1610.full)

__GEO Accession Number:__ [GSE65912](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE65912)

__Number of Experiments:__ 50

__Cell Line:__ Human lymphoblastoid cell lines. See also [https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE65912](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE65912)

__Notes:__ A single ribo file can contain 50 experiments with a file of size of ~110 MB.
Due to file size limitations, we can only provide ribo files for the individual experiments as the merged ribo files exceed this limit.
To generate the combined ribo file, you can combine these ribo files. For example:

```
cd cenik_et_al
experiments=\`ls experiments/*ribo`
ribopy merge all.ribo $experiments
```


### 2) Wu et al.

__Publication:__ [High-Resolution Ribosome Profiling Defines Discrete Ribosome Elongation States and Translational Regulation during Cellular Stres, Wu et al., Molecular Cell, 2019](https://www.sciencedirect.com/science/article/pii/S1097276518310633?via%3Dihub)

__GEO Accession Number:__ [GSE115162](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE115162)

__Number of Experiments:__ 6

__Cell Line:__ HeLa and MDA-MB-231

__Notes:__ The ribosome protected read length distribution is bimodal.


### 3) Sidrauski et al.

__Publication:__ [The small molecule ISRIB reverses the effects of eIF2α phosphorylation on translation and stress granule assembly, Sidrauskiet al., eLife, 2015](https://elifesciences.org/articles/05033)

__GEO Accession Number:__ [GSE65778](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE65778)

__Number of Experiments:__ 4

__Cell Line:__ HEK293T

__Notes:__ In this data, you can see an example of a ribo file containing RNA-seq data paired with ribosome profiling data. More precisely, among 16 experiments, we picked two ribosome profiling (GSM1606107 and GSM1606108) and two RNA-Seq experiments (GSM1606099 and GSM1606100). We paired GSM1606107 with GSM1606099, and GSM1606108 with GSM1606100.   


## Compressed text versus Ribo file

We dumped the contents of the ribo file into text files using `ribopy merge`. Then we compressed these files via gzip. Below, for each dataset, we report and compare the size of the ribo files to the total size of the compressed text files. Note that we used ribo files without coverage data for the comparisons.

The compressed text files are generated using the the script `dump_to_csv.sh` in this repository. File sizes are reported in mega bytes.


| Data Set         | #Experiments | Comp. Text. Total Size (M) | Ribo File Size (M) | Text / Ribo |
| ---------------  | -----------: | -------------------------: | -----------------: | ----------: |
| Cenik et al.     | 50           | 1711                       | 110                | ~15         |
| Wu et al.        | 6            | 270                        | 13                 | ~22         |
| Sidrauski et al. | 4            | 144                        | 7.9                | ~18         |


