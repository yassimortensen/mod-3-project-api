
doc = Nokogiri::HTML(open("http://www.pajiba.com/tv_reviews/game-of-thrones-hot-pies-choose-your-own-adventure.php"))

div = doc.css('div[style="padding-bottom:1200px;"]')

# a_div_clone = div.clone
# anchors = a_div_clone.css('a')
# anchor_id = anchors.css('a[id]')
# anchor_href = a_div_clone.css('a[href]')

# body_clone = div.clone
# body_div = body_clone.search("//a").remove
# body = body_clone.first.text

div.each do |tag|
  tag.css('a[href]').each do |href|
    href.each do
      stage = tag.children[2].attributes["id"].value
      body = href.children.text
      button_txt = href.attributes["href"].value #this is just to slice correctly
      button_slc = button_txt.slice!(0)
      next_step = href.attributes["href"].value
      description = tag.children[4].text.strip
      new_stage = StoryStage.new
      byebug
    end
  end
end

# t.string :stage
# t.string :body
# t.string :button
# t.string :nextStep
# t.string :description
# t.integer :pic_id

# next_step = href.attributes["href"].value
# description = tag.children[4].text.strip
# body = href.children.text
# step = tag.children[2].attributes["id"].value


# puts body
# puts anchors
# puts anchor_id
# puts anchor_href



# body_array = []
# body_div.each{|text| body_array.push(text.text)}
