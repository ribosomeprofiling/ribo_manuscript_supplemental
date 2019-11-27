library(ribor)

working_folder <- "."
wu.path        <- paste(c(working_folder,"ribo/all.ribo"), collapse = "/")
wu.ribo        <- create_ribo(wu.path, rename = rename_default )

wu_exp_1 <- "HeLa_Gln_strv_9hr"
wu_exp_2  <- "MDA_MB_231"

pdf("length_distribution.pdf")
plot_length_distribution(x           = wu.ribo,
                         experiments = c(wu_exp_1, wu_exp_2),
                         region      = "CDS",
                         fraction    = TRUE)
dev.off()

############################################

pdf("metagene_stop.pdf")
plot_metagene(wu.ribo,
              site        = "stop",
              normalize = TRUE,
              experiments = c(wu_exp_1, wu_exp_2),
              range.lower = 28,
              range.upper = 32)
dev.off()

pdf("region_counts.pdf")
plot_region_counts(x           = wu.ribo,
                   experiments = c(wu_exp_1, wu_exp_2),
                   range.lower = 28,
                   range.upper = 32)
dev.off()

