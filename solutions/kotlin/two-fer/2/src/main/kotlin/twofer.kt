fun twofer(name: String? = null): String {

    val outputName = name?.let { it } ?: "you"

    return "One for $outputName, one for me."
}