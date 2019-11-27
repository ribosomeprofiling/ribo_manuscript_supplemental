# This script takes a ribo file and dumps its contents to compressed text files.
# We used the output of this to compare the total size of the text files to the size of the ribo file

dumpdir="dump"
mkdir $dumpdir

# Annotation
ribopy dump annotation all.ribo | gzip > ${dumpdir}/annotation.bed.gz

# Transcript Lengths
ribopy dump reference-lengths all.ribo | gzip > ${dumpdir}/transcript_lengths.tsv.gz

# Region Counts
regions="UTR5 UTR5_junction CDS UTR3 UTR3_junction"
for region in $regions;
do
	echo $region
	ribopy dump region-counts -r ${region}  all.ribo | gzip > ${dumpdir}/${region}.csv.gz
done

# Metagene 
ribopy dump metagene -s start --nosumtrans all.ribo | gzip > ${dumpdir}/metagene_start.csv.gz
ribopy dump metagene -s stop --nosumtrans all.ribo | gzip >  ${dumpdir}/metagene_stop.csv.gz

# If there is RNA-Seq data
# ribopy rnaseq get  all.ribo | gzip > ${dumpdir}/rnaseq_csv.gz

du -s  ${dumpdir} all.ribo
du -hs ${dumpdir} all.ribo 


