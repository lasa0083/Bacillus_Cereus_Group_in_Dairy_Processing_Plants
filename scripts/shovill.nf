workflow {
    // define the parameters
    input = Channel
       f_reads = Channel.fromPath("/path/to/trimmed_fastp_poly_a_trim_galore/*_trimmed_1_val_1.fq.gz")
        .map{tuple( it.name.split('_trimmed_1_val_1.fq.gz')[0], it )}
       r_reads = Channel.fromPath("/path/to/trimmed_fastp_poly_a_trim_galore/*_trimmed_2_val_2.fq.gz")
        .map{tuple( it.name.split('_trimmed_2_val_2.fq.gz')[0], it )}
    shovill_input = f_reads
         .join(r_reads)
    // run the process
    shovill(shovill_input)
}

process shovill {
  container "/path/to/containers/shovill_1.1.0--hdfd78af_1.sif*"
  publishDir "shovill_output/", mode: "copy"
  input:
    tuple val(sample_id), path(f_reads), path(r_reads)
  output:
    tuple val(sample_id), path("${sample_id}_shovill")
  script: 
  """
  shovill  errorStrategy 'ignore' --cpus ${task.cpus} --assembler skesa --minlen 200 --mincov 10 --outdir "${sample_id}_shovill" --R1 "${f_reads}" --R2 "${r_reads}"   
  """
}
