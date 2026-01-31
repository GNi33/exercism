using Unicode

const TEST_GRAPHEMES = true

myreverse(str) = join(reverse(collect(Unicode.graphemes(str))))
