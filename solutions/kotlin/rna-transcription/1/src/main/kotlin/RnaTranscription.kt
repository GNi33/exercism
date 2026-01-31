fun transcribeToRna(dna: String): String {

    val dnaToRnaMap = hashMapOf('G' to 'C', 'C' to 'G', 'T' to 'A', 'A' to 'U')

    return dna.map {
        dnaToRnaMap[it]?.toString() ?: it.toString()
    }.joinToString("")
}
