
doc = Nokogiri::HTML(open("http://www.pajiba.com/tv_reviews/game-of-thrones-hot-pies-choose-your-own-adventure.php"))

div = doc.css('div[style="padding-bottom:1200px;"]')

a_div = div

body_div = div

remove_a =  body_div.search("//a").remove

body = body_div.text

puts body
