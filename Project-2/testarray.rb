require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(townurl)
	doc = Nokogiri::HTML(open(townurl))
	doc1 = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	return doc1.text
end

def get_all_the_urls_of_val_doise_townhalls(regionurl)
	doc2 = Nokogiri::HTML(open(regionurl))
	i = 1 ; j = 1
	liste = Hash.new
	while i < 4
		while (j < 63 && i < 3) || j < 62
			doc3 = doc2.xpath("/html/body/table/tr[3]/td/table/tr/td[2]/table/tr[2]/td/table/tr/td[#{i}]/p/a[#{j}]/@href")
			liste[doc3.to_s.split('/').last.split('.').first] = get_the_email_of_a_townhal_from_its_webpage(doc3.to_s.sub(".", "http://annuaire-des-mairies.com"))
			j += 1
		end
		j = 1
		i += 1
	end
	print liste
end

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")