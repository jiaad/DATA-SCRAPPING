require 'rubygems'
require 'nokogiri'
require 'open-uri'


 def get_town_hall_email(town_hall_urls)
  email_town_hall = []
  doc = Nokogiri::HTML(open(town_hall_urls))
  doc.xpath('//tbody/tr[4]/td[2]').each do |v|
  email_town_hall = [v.text]
end
  return email_town_hall

end
get_town_hall_email("http://annuaire-des-mairies.com/95/avernes.html")



def get_townhall_urls
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  final = []
  doc.xpath("//tr[2]//p//a/@href").each do |v|
  final.push(v.text)
  end
  return  @result = final.map { |e| e.gsub('./' , 'http://annuaire-des-mairies.com/') }
end



 def url_email_methode #urls_des_mairies
   email=[]
   n = get_townhall_urls.count
   i = 0
   while i < n
     doc = Nokogiri::HTML(open("#{get_townhall_urls[i]}"))
     doc.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').map do |x|
        email.push(x.text)
     end
     email[i]
          i += 1
   end

end
 p url_email_methode
