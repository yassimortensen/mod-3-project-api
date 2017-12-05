
doc = Nokogiri::HTML(open("http://www.pajiba.com/tv_reviews/game-of-thrones-hot-pies-choose-your-own-adventure.php"))

div = doc.css('div[style="padding-bottom:1200px;"]')

body_clone = div.clone
body_div = body_clone.search("//a").remove
body = body_clone.first.text

a_div_clone = div.clone
anchors = a_div_clone.css('a')
anchor_id = anchors.css('a[id]')
anchor_href = a_div_clone.css('a[href]')


puts body
puts anchors
puts anchor_id
puts anchor_href



# body_array = []
# body_div.each{|text| body_array.push(text.text)}
