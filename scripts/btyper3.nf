workflow {
    // define the parameters
    i = Channel
        .fromPath("assemblies_fasta/*.fasta")
        .map{tuple( it.name.split('.fasta')[0], it )}
        //.map{file -> tuple(file.simpleName, file)}
    // run the process
    btyper3(i)
}

process btyper3 {
  container "/proj/nobackup/carroll_hpc2n/containers/btyper3_3.4.0--pyhdfd78af_0.sif"
  publishDir "btyper3_output/", mode: "copy"
  input:
    tuple val(accession), path(contigs)
  output:
    tuple val(accession), path("${accession}_btyper3")
  script:
  """
  btyper3 -i "${contigs}" -o "${accession}_btyper3"  
  """
}
