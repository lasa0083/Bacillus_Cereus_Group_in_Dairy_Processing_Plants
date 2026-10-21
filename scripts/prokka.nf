workflow {
    // define the parameters
        input = Channel
        .fromPath("fna/*.fna")
        .map{tuple( it.name.split('.fna')[0], it )}
        //.map{file -> tuple(file.simpleName, file)}
    // run the process
    prokka(input)
}

process prokka {
  container "/path/to/containers/prokka_1.14.6--pl5321hdfd78af_5.sif"
  publishDir "prokka_output/", mode: "copy"
  input:
    tuple val(accession), path(contigs)
  output:
    tuple val(accession), path("${accession}_prokka")
  script:
  """
  prokka --outdir "${accession}_prokka" --prefix "${accession}" --cpus ${task.cpus} "${contigs}" 
  """
}
