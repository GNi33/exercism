class Raindrops {
    companion object {
        fun convert(input: Int): String {

            val output = mutableListOf<String>()
            val divisors = hashMapOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

            divisors.toSortedMap().forEach {
                if (input.rem(it.key) == 0) {
                    output.add(it.value)
                }
            }

            if (output.isNotEmpty()) {
                return output.joinToString(separator = "")
            }

            return input.toString()
        }
    }
}