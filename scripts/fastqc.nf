workflow {
   // define the parameters
    input = Channel
        .fromPath("./trimmed_fastp/*.fastq.gz")
        .map{tuple( it.name.split('.fastq.gz')[0], it )}
        //.map{file -> tuple(file.simpleName, file)}
    // run the process
    fastqc(input)
}

process fastqc {
  container "/proj/nobackup/carroll_hpc2n/containers/fastqc_0.12.1--hdfd78af_0.sif"
  publishDir "fastqc_output_trimmed/", mode: "copy"
  input:
    tuple val(accession), path(reads)
  output:
    tuple val(accession), path("${accession}_fastqc")
  script: 
  """
  mkdir "${accession}_fastqc" 
  fastqc "${reads}" -o "${accession}_fastqc" --threads ${task.cpus}  
  """
}

