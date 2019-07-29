#require 'bundler'
#Bundler.require
require 'gossip'


class ApplicationController < Sinatra::Base #nous avons créé une classe ApplicationController qui hérite (<) de la classe Sinatra::Base
	get '/' do # ce qui revient à dire va sur : http://localhost:4567/ mais il ne faut pas l'écrire car localhost peut etre modifié
		erb :index, locals: {gossips: Gossip.all} #une méthode locals, qui permet d'envoyer à notre fichier ERB des variables que l'on utilisera. Ici on veut lui envoyer l'array obtenu par Gossip.all
	end

	get '/gossips/new/' do #ce qui reviens à dire va sur : http://localhost:4567/ + gossips/new/
		erb :new_gossip #va voir le fichier new_gossip.erb
	end

	post '/gossips/new/' do
		Gossip.new(params["gossip_author"], params["gossip_content"]).save
		 # Avec Gossip.new on crée un nouvel objet Gossip et avec .save on lui applique la méthode save
		redirect '/' #redirige vers l'accueil
	end

	get '/gossips/:id' do #créer une page pour chaque gossips avec une URL dynamique
    	erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)} 
  	end

  	get '/gossips/:id/edit/' do
  		erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  	end

  	post '/gossips/:id/edit/' do
  		Gossip.update(params['id'], params["gossip_author"], params["gossip_content"])
  		redirect '/'
  	end
end

















  	# get '/gossips/:id/edit' do
   #  erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  	# end

   #  post '/gossips/edit/' do
   #  Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
   #  redirect '/'
  	# end