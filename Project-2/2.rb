require 'nokogiri'
require 'open-uri'

#On fait référence à ce qui est écrit en dernière ligne
def get_the_currency(market_url)
	doc = Nokogiri::HTML(open(market_url))
#On créer un hash 
	liste = Hash.new
#On créer un compteur qui correspond à la cohérence monnaie/devise.
	i = 1
#Tant que le compteur fait référence à un prix
	while i < doc.css("a.price").size
#C'est dans tr que l'on indique le compteur car il correspond à la crptyomonnaie à choisir
		liste[doc.xpath("/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/table/tbody/tr[#{i}]/td[2]/a").text] = doc.xpath("/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/table/tbody/tr[#{i}]/td[5]/a").text
		i += 1
	end
	print liste
end

get_the_currency("https://coinmarketcap.com/all/views/all/")

