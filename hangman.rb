class Huffman
	def initialize(word, no_attempts)
		@word = word
		@arr = @word.downcase.split("")
		@total_attempts = no_attempts
		@word_array = Array.new(@word.size, "_")
		@wrong_attempt = 0
	end

	def play
		@wrong_guess = []
		while @total_attempts > 0
			puts "Current word array : #{@word_array.join(" ")}"
			puts "************************"
			puts "Guess the character"
			char = gets.chomp.downcase
			@total_attempts -= 1
			unless check_inclusion(char)
				@wrong_guess <<  char
				puts "wrong guess: #{@wrong_guess.join(" ")}"
				@wrong_attempt += 1
				puts "u dead" if @wrong_attempt == 6
			else
				puts "correct guess"
				puts "Current word array : #{@word_array.join(" ")}"
			end
			if @word_array.include?("_")
				puts "total_attempts left: #{@total_attempts}\nwrong_attemptes left: #{@wrong_attempt}"
			else
				break
			end
		end
	 	if @word_array.include?("_")
			puts "chances over game over-----> actual word was #{@word}" if @total_attempts == 0
		else
			puts  "U WON!!!! ---word was #{@word}"
		end
	end

	private

	def check_inclusion(char)
		return false unless @arr.include? char
		@arr.each_with_index{ |a, i| @word_array[i] = @word[i] if a == char}
	end
end