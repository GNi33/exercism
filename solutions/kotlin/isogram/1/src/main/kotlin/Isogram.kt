object Isogram {

    fun isIsogram(input: String): Boolean {

        val lowercaseInput = input.toLowerCase()
        val alphabet = 'a'..'z'
        val checkMap = HashSet<Char>()

        for (letter in lowercaseInput) {
            if (letter in alphabet) {
                if (checkMap.contains(letter)) {
                    return false
                }

                checkMap.add(letter)
            }
        }

        return true
    }
}