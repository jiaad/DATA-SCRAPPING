require 'rubygems'
require 'nokogiri'
require 'open-uri'
@url_page = "https://coinmarketcap.com/all/views/all/"


def coin_name
  @name=[]
  doc = Nokogiri::HTML(open(@url_page))
  doc.xpath('//tr/td[3]').each do |v|
  @name.push(v.text)
  end
  return @name
end
coin_name

def coin_price
  @prix = []
  doc = Nokogiri::HTML(open(@url_page))
  doc.xpath('//td/a[@class="price"]').each do |v|
  @prix.push(v.text)
  end
return @prix
end
coin_price

def hash_combiné
  leshashes = @name.map.with_index do |key , values|
    combined_hash = {}
    combined_hash[key] = @prix[values]
    combined_hash
  end
end
 p hash_combiné


#======================= MARIE ================================================
