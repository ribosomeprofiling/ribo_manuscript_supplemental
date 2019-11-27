# Generating a combined ribo file

You can combine all experiments in one ribo file using `ribopy merge`.

For example

```
experiments=`ls experiments/*ribo`
ribopy merge all.ribo $experiments
```
