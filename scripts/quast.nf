workflow {
    // define the parameters
    input = Channel
        .fromPath("fna/*.fna")
        .map{tuple( it.name.split('.fna')[0], it )}
        //.map{file -> tuple(file.simpleName, file)}
    // run the process
    quast(input)
}

process quast {
  container "/path/to/containers/quast_5.2.0--py39pl5321h4e691d4_3.sif"
  publishDir "quast/", mode: "copy"
  input:
    tuple val(accession), path(contigs)
  output:
    tuple val(accession), path("${accession}_quast")
  script:
  """
  quast.py --output-dir "${accession}_quast" --min-contig 1 --threads ${task.cpus} "${contigs}"
  """
}
