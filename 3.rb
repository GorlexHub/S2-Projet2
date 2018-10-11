require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_depute
  info = []
  names = []
  surnames = []
  emails = []
  n = 0

  doc = Nokogiri::HTML(open("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s"))

  doc.xpath("//*[@id=\"mw-content-text\"]/ul/li").each do |node|
  	
    fullname = node.text.match(/^[^\(]+/)[0].split
    names << fullname[0]
    surnames << fullname[1, 2].join(' ')
    if node.text.match(/\)(.*)/) != nil
      emails << node.text.match(/\)(.*)/)[0].tr(';','').split.select{|x| x.include?("assemblee")}[0]
    else
      emails << ""
    end
  end
  while n < doc.xpath("//*[@id=\"mw-content-text\"]/ul/li").length do
    info[n] = {:first_name => names[n], :last_name => surnames[n], :email => emails[n]}
    n += 1
  end
  puts info
end

get_depute