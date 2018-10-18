require 'open-uri'
    require 'nokogiri'
# /html/body/div[3]/div/div/section/div/article/div[3]/div/div[3]/div[1]' Affiche les A
# /html/body/div[3]/div/div/section/div/article/div[3]/div/div[3] Affiche tous mais avec les titres
    doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    doc.xpath('/html/body/div[3]/div/div/section/div/article/div[3]/div/div[3]').each do |node|
      puts node.text
    end
    