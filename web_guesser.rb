require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  background = check_background(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :background => background}
end

def check_background(guess)
  if guess < SECRET_NUMBER - 5
    :crimson
  elsif guess > SECRET_NUMBER + 5
    :crimson
  elsif guess < SECRET_NUMBER
    :lightcoral
  elsif guess > SECRET_NUMBER
    :lightcoral
  else
    :lawngreen
  end
end
def check_guess(guess)
  if guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  else
    "You got it right!"
  end
end
