library(Rsubread)
bfiles <- c("SSR3711076_WT1.bam","SSR3711077_WT2.bam","SSR3711079_WT3kd.bam","SSR3711080_WT4kd.bam", "SSR3711082_p53KO.bam", "SSR3711083_p53KO2.bam", "SSR3711084_p53KO3kd.bam", "SSR3711085_p53KO4kd2.bam" )
fc <- featureCounts(files=bfiles,
                    annot.ext="mm10-ensembl_99-genes.gtf.",
                    isGTFAnnotationFile=T, useMetaFeatures=T,
                    minMQS=10, largestOverlap=T, isPairedEnd=F,
                    requireBothEndsMapped=F, nthreads=5)

# Exportar la tabla para trabajar en la computadora
write.table(
  x=data.frame(fc$annotation[,c("GeneID","Length")],
               fc$counts,
               stringsAsFactors=FALSE),
  file="counts2.txt",
  quote=FALSE,
  sep="\t",
  row.names=FALSE) 
