
THP session 9 - 29/07/2019

The Gossip Project, construit par Sarah Bouchir

1.config.ru
--> Permet de lancer tout le programme comme un "perform"


2. controller.rb
--> Création d'une classe ApplicationController qui hérite (<) de la classe Sinatra::Base
--> Dans la class, on donne les chemins :" get '/' do " et on leur dis quels fichiers utiliser


3. Création de la visualisation : 
	3.1. index.erb qui est la page d'accueil et qui présente les gossips déja entrés
	3.2. new_gossip.erb qui proposer d'entrer un nouveau gossip
	3.3. show.erb qui montre le détail d'un gossip déja entré


4. gossip.rb
Créer un Gossip et l'ajouter en base de données
--> Gossip.new(gossip_author,gossip_content).save

5. dossier views 
affichage de nos pages




GET : lecture
"hey, si quelqu'un va sur /gossips/new/ envoie-lui les view new_gossip"
= affiche les fichiers


POST : action
"hey bro, récupère les informations du formulaire et convertis-les en une création de gossip dans ma base"