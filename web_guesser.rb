require 'sinatra'
require 'sinatra/reloader'
SECRETNUM = rand(101)
background = "grey"
get '/' do
	guess = params["guess"].to_i
	message = check_guess(guess)
	background = backgroundcolor (message)
	erb :index, :locals => {:number => SECRETNUM , :message => message, :guessColor => background}
end

def check_guess (guess)
	if guess == 0
		message = "Begin Guessing!";
	elsif guess > SECRETNUM+5
		message = "Way Too High!";
	elsif guess > SECRETNUM
		message = "Too High"
	elsif guess < SECRETNUM-5
		message = "Way Too Low!"
	elsif guess < SECRETNUM
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