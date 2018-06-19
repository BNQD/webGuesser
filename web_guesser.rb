require 'sinatra'
require 'sinatra/reloader'

@@secretNum = rand(101)
background = "grey"
guessesRemaining = 5

get '/' do
	guess = params["guess"].to_i
	message = check_guess(guess)
	background = backgroundcolor (message)
	guessesRemaining, secretNum = decreaseGuesses(guessesRemaining)
	erb :index, :locals => {
		:number => secretNum , :message => message, :guessColor => background,
		:numGuesses => guessesRemaining
	}
end

def check_guess (guess)
	if guess == 0
		message = "Begin Guessing!";
	elsif guess > @@secretNum+5
		message = "Way Too High!";
	elsif guess > @@secretNum
		message = "Too High"
	elsif guess < @@secretNum-5
		message = "Way Too Low!"
	elsif guess < @@secretNum
		message = "Too Low"
	else 
		message = "Correct!";
	end
	return message
end

def backgroundcolor (message)
	case message
		when "Correct!"
			background = "green"
		when "Too Low"
			background = "pink"
		when "Too High"
			background = "pink"
		when "Way Too Low!"
			background = "red"
		when "Way Too High!"
			background = "red"
		else
			background = "black"
	end
	return background
end

def decreaseGuesses (num)
	if (num == 1)
		randomNum = rand(101)
		num = 5
	else
		num -= 1
		randomNum = @@secretNum
	end
	return num, randomNum
end

