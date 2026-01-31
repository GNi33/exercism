object Pangram {

    fun isPangram(sentence: String): Boolean {

        if(sentence.length < 26) return false

        val lcs = sentence.toLowerCase()
        val charSequence = 'a' .. 'z'

        for (char in charSequence) {
            if (char !in lcs) return false
        }

        return true
    }

}