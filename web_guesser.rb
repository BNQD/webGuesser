require 'sinatra'
require 'sinatra/reloader'
SECRETNUM = rand(101)
guess = -1
get '/' do
	guess = params["guess"].to_i
	message = check_guess(guess)
	erb :index, :locals => {:number => SECRETNUM , :message => message}
end

def check_guess (guess)
	if guess == -1
		message = "Begin Guessing!"
	elsif guess > SECRETNUM+5
		message = "Way Too High!"
	elsif guess > SECRETNUM
		message = "Too High"
	elsif guess < SECRETNUM-5
		message = "Way Too Low!"
	elsif guess < SECRETNUM
		message = "Too Low"
	else
		message = "Correct!"
	end
end