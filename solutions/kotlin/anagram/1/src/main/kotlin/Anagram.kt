class Anagram(private val word: String) {

    private val wordSet = word.toLowerCase().toCharArray().sorted()

    fun match(possibleAnagrams: List<String>): Set<String> {
        val resultSet = mutableListOf<String>()

        possibleAnagrams.forEach {
            val possibleAnagram = it.toLowerCase()
            val sortedWord = possibleAnagram.toCharArray().sorted()

            if (sortedWord.equals(wordSet) && !possibleAnagram.equals(word.toLowerCase())) {
                resultSet.add(it)
            }
        }

        return resultSet.toSet()
    }

}