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
    redirect '/confirm'
end

get '/confirm' do
    erb :confirm, locals: {pizSize: session[:pizSize], crustType: session[:crustType], sauces: session[:sauces], cheese: session[:cheese], meat: session[:meat], veg: session[:veg], deliver: session[:deliver], address: session[:address]}
end