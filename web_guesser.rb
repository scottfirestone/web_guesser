require 'sinatra'
require 'sinatra/reloader'

@@guess_count = 5
@@secret_number = rand(101)
cheat_mode = ""

get '/' do
  get_new_number = false
  if @@guess_count == 0 && params["guess"] != @@secret_number
    @@guess_count = 5
    @@secret_number = rand(101)
    guess = :loser
  elsif
    if params["guess"] == nil
      guess = :no_guess
    else
      guess = params["guess"].to_i
      @@guess_count -= 1
    end
  end
  message = check_guess(guess)
  background = check_background(guess)
  erb :index, :locals => {:message => message, :background => background}
end

def check_background(guess)
  if guess == :no_guess
    :white
  elsif guess == :loser
    :white
  elsif guess < @@secret_number - 5
    :crimson
  elsif guess > @@secret_number + 5
    :crimson
  elsif guess < @@secret_number
    :lightcoral
  elsif guess > @@secret_number
    :lightcoral
  else
    @@guess_count = 5
    @@secret_number = rand(101)
    :lawngreen
  end
end

def check_guess(guess)
  if guess == :no_guess
    "Please make a guess!!"
  elsif guess == :loser
    "You lost! The SECRET NUMBER has been reset!"
  elsif guess < @@secret_number - 5
    "Way too low!"
  elsif guess > @@secret_number + 5
    "Way too high!"
  elsif guess < @@secret_number
    "Too low!"
  elsif guess > @@secret_number
    "Too high!"
  else
    "You got it right! SECRET NUMBER will reset!"
  end
end
