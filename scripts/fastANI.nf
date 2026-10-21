workflow {
    // define the parameters
    q= Channel
      .fromPath("./*.fna")
       .map{tuple( it.name.split('.fna')[0], it )}
   //.map{file -> tuple(file.simpleName, file)}

   // run the process
    fastANI(q)
}

process fastANI {
  container "/path/to/containers/fastani_1.34--h4dfc31f_0.sif"
  publishDir "fastAni_output_2/", mode: "copy"
  input:
    tuple val(accession), path(contigs)
  output:
    tuple val(accession), path("${accession}_fastANI")
  script:
  """
  fastANI --ql /path/to/file/all_ST26_list.txt --rl /path/to/file/all_ST26_list.txt -t ${task.cpus}  -o "${accession}_fastANI"
    
  """
}
