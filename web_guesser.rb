require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if guess < SECRET_NUMBER - 5
    message = "Way too low!\r\n\r\nThe SECRET NUMBER is #{SECRET_NUMBER}"
  elsif guess > SECRET_NUMBER + 5
    message = "Way too high!\r\n\r\nThe SECRET NUMBER is #{SECRET_NUMBER}"
  elsif guess < SECRET_NUMBER
    message = "Too low!\r\n\r\nThe SECRET NUMBER is #{SECRET_NUMBER}"
  elsif guess > SECRET_NUMBER
    message = "Too high!\r\n\r\nThe SECRET NUMBER is #{SECRET_NUMBER}"
  else
    message = "You got it right!\r\n\r\nThe SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
