require_relative 'hangman'

words = %w[First second Third fourth Fifth sixth]
word = words.sample.capitalize
game = Huffman.new(word, word.size+2)
game.play