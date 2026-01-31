fun twofer(name: String? = null): String {

    var outputName = name

    if (name == null) {
        outputName = "you"
    }

    return "One for $outputName, one for me."
}