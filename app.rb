require 'sinatra'
enable :sessions

get '/' do 
    erb :home
end