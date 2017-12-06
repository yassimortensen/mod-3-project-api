
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

      body = href.children.text
      button_txt = href.attributes["href"].value #this is just to slice correctly
      button_slc = button_txt.slice!(0)
      stage = button_txt
      next_step = href.attributes["href"].value
      begin
        description = tag.children.text.strip
      rescue NoMethodError
        byebug
      end
      new_stage = StoryStage.new(stage: stage, body: body, button: button_txt, nextStep: next_step, description: description, pic_id: 1)
      new_stage.save
    end
  end
end

# Pic.create(picUrl: 'http://robertmball.com/wp-content/uploads/2017/05/1.jpg')
# Pic.create(picUrl: 'http://78.media.tumblr.com/cff15390797a22064509e2ffeadb950a/tumblr_npubfyZl2o1tuzdqso1_540.jpg')
# Pic.create(picUrl: 'https://78.media.tumblr.com/8a33a8c37f734b5e63d2caa484eb0d37/tumblr_ou6g5pd62r1qzykvyo1_500.jpg')
# div.each do |tag|
#   tag.css('a[href]').each do |href|
#     href.each do
#       byebug
#       stage = tag.children[2].attributes["id"].value
#       body = href.children.text
#       button_txt = href.attributes["href"].value #this is just to slice correctly
#       button_slc = button_txt.slice!(0)
#       next_step = href.attributes["href"].value
#       description = tag.children[4].text.strip
#       new_stage = StoryStage.new(stage: stage, body: body, button: button_txt, nextStep: next_step, description: description, pic_id: 1)
#       new_stage.save
#     end
#   end
# end

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
