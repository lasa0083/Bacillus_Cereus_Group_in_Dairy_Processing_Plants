workflow {
    // define the parameters
    input = Channel
       f_reads = Channel.fromPath("./trimmed_fastp/*_trimmed_1.fastq.gz")
        .map{tuple( it.name.split('_trimmed_1.fastq.gz')[0], it )}
       r_reads = Channel.fromPath("./trimmed_fastp/*_trimmed_2.fastq.gz")
        .map{tuple( it.name.split('_trimmed_2.fastq.gz')[0], it )}
    trimgalore_input = f_reads
         .join(r_reads)
    // run the process
    trimgalore(trimgalore_input)
}

process trimgalore {
  container "/path/to/trim-galore_2.3.0--hf1b6044_0.sif"
  publishDir "trimgalore_output/", mode: "copy"
  input:
    tuple val(sample_id), path(f_reads), path(r_reads)
  output:
    tuple val(sample_id), path("${sample_id}_trim_galore")
  script: 
  """
  trim_galore --poly_a  --poly_g --cores ${task.cpus} --paired -o "${sample_id}_trim_galore" "${f_reads}" "${r_reads}"   
  """
}
