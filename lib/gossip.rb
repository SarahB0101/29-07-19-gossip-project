
require 'csv'


class Gossip
	attr_accessor :author, :content, :comments

	
	 #-------------------------- INITIALISATION -------------------------->
	
	def initialize(author, content)
		@author = author
		@content = content
		@comments = comments
	end



   #-------------------------- SAVE BASE DE DONNÉE -------------------------->

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv| #Nous ouvrons le CSV en mode écriture (ab)
			csv << [@author, @content]
			
		end
		
	end


 #-------------------------- STOCKER TOUS LES GOSSIPS DANS UN TABLEAU -------------------------->


	def self.all #Gossip.all
		all_gossips = [] #on initialise un array vide
		
		CSV.read("./db/gossip.csv").each do |csv_line| #Nous ouvrons le CSV en mode écriture (ab)
			all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  	end

  		return all_gossips #on retourne un array rempli d'objets Gossip
	end



 #-------------------------- SAVE BASE DE DONNÉE -------------------------->



	def self.find(id)
		gossips = [] #on stock la line CSV demandée
		CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
			if (id == index+1)
				gossips << Gossip.new(csv_line[0], csv_line[1])
			break
			end
	  	end
	  	return gossips
	end



 #-------------------------- MODIFIE BASE DE DONNÉE -------------------------->

	def self.update(id,author,content)
		gossips = []

    # recréé l'array et csv avec les données modifiées.
	 	CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
	 		if id.to_i == (index + 1)    # i 
	 			gossips << [author, content]
	 		else
	 			gossips << [csv_line[0], csv_line[1]]
	 		end
	 	end

	 	CSV.open("./db/gossip.csv", "w") do |csv| 
	 		gossips.each do |csv_line|
	 			csv << csv_line
     		end
     	end
   end



def comments
	CSV.open("./db/comments.csv", "ab") do |csv| #Nous ouvrons le CSV en mode écriture (ab)
			csv << [@comments]
			
		end
	
end


end







