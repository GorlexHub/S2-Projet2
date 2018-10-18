require 'nokogiri'
require 'open-uri'

#On fait référence à ce qui est écrit en 19
def get_the_email_of_a_townhal_from_its_webpage(townurl)
	doc = Nokogiri::HTML(open(townurl)) 
#XPath collé içi via outil de développement web 
	doc1 = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	return doc1.text
end

def get_all_the_urls_of_val_doise_townhalls(regionurl)
#On affiche la page en question
	doc2 = Nokogiri::HTML(open(regionurl))
#Début à 1
	i = 1 ; j = 1
#Création d'un hash avec url (ville) et mail
	liste = Hash.new
#4 mairies
	while i < 4
#63 Mairies et 3 colonnes
		while (j < 63 && i < 3) || j < 62
#On cherche l'emplacement du lien où sont contenus les mais et les noms où i: colonnes et j:lignes
			doc3 = doc2.xpath("/html/body/table/tr[3]/td/table/tr/td[2]/table/tr[2]/td/table/tr/td[#{i}]/p/a[#{j}]/@href")
#On associe les noms aux mails en élague jusqu'au nom
			liste[doc3.to_s.split('/').last.split('.').first] = get_the_email_of_a_townhal_from_its_webpage(doc3.to_s.sub(".", "http://annuaire-des-mairies.com"))
			j += 1
		end
		j = 1
		i += 1
	end
	print liste
end

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")