#global variables
$file = File.open("word.txt", "r")
$running = true
$incorrect_count = 0

def start
	word = getWord
	gameLoop(word)
end

def gameLoop(word)
	while $running
		letter = chooseLetter
		incorCheck
		choice = Hangman.new(letter, word)
		choice.letterCheck
		choice.update
	end
end

def getWord
	correct_array = []

	lines = File.readlines $file
		lines.each do |i|
			if i.length < 12 && i.length > 5
				correct_array.push(i)
			end
		end 
		word = correct_array.sample
		return word
end

def chooseLetter
	puts "guess a letter!"
	guess = gets.chomp
	if guess.length > 1
		chooseLetter
	end

	return guess
end

#checks to see if the amount of incorrect guesses results in a game over
def incorCheck
	if $incorrect_count == 6
		gameOver
	end
end

class Hangman
	@@correct_letters = []
	@@incorrect_letters = []

	def initialize(letter, word)
		@letter = letter
		@word = word
	end

	def letterCheck 
		
	end

	def update
		puts "Incorrect letters: "
		@@incorrect_letters.each do |i|
			print i + ", "
		end
		print "\n"
		puts "------------------"
		puts "Incorrect Choices: #{$incorrect_count}"
		puts "Correct Guesses!: "
		@@correct_letters.each do |i|
			print i + ", "
		end
		puts @word
	end
end
start