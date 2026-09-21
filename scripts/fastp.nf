workflow {
    // define the parameters
    f_reads = Channel.fromPath("raw_reads/*_1.fastq.gz")
        .map{tuple( it.name.split('_1.fastq.gz')[0], it )}
    r_reads = Channel.fromPath("raw_reads/*_2.fastq.gz")
        .map{tuple( it.name.split('_2.fastq.gz')[0], it )}
    fastp_input = f_reads
        .join(r_reads)
    // run the process
    fastp(fastp_input)
}

process fastp {
  container "/proj/nobackup/carroll_hpc2n/containers/fastp_0.23.4--hadf994f_3.sif"  
  publishDir "trimmed_fastp", mode: "copy"
  input:
      tuple val(sample_id), path(f_reads), path(r_reads)
  output:
      tuple val(sample_id), path("${sample_id}_trimmed_1.fastq.gz"), path("${sample_id}_trimmed_2.fastq.gz")
  errorStrategy 'ignore'
  script:
  """
  fastp --trim_poly_g --trim_poly_x -i "${f_reads}" -I "${r_reads}" -o "${sample_id}_trimmed_1.fastq.gz" -O "${sample_id}_trimmed_2.fastq.gz" --detect_adapter_for_pe --length_required 36 --thread ${task.cpus}
  """
}
