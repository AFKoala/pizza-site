require 'sinatra'
enable :sessions

get '/' do 
    erb :home
end

post '/order' do
    session[:pizSize] = params[:pizSize]
    session[:crustType] = params[:crustType]
    session[:sauces] = params[:sauces]
    session[:cheese] = params[:cheese]
    session[:meat] = params[:meat]
    session[:veg] = params[:veg]
    session[:deliver] = params[:deliver]
    session[:address] = params[:address]
    redirect '/confirm_correct'
end

get '/confirm_correct' do
    erb :confirm_correct, locals: {pizSize: session[:pizSize], crustType: session[:crustType], sauces: session[:sauces], cheese: session[:cheese], meat: session[:meat], veg: session[:veg], deliver: session[:deliver], address: session[:address]}
end

post '/confirm' do
    session[:confirmed] = params[:confirmed]
    session[:good] = params[:good]
    redirect '/results'
end

get '/results' do
    erb :results, locals: {confirmed: session[:confirmed], address: session[:address], good: session[:good]}
end