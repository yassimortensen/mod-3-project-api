
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
      next_step = href.attributes["href"].value
      begin
        stage = tag.css('a[id]')[0].attributes["id"].value
      rescue NoMethodError
        byebug
      end
      description_remove = tag.children.text
      description_array = description_remove.split(/[\n]+/)
      description = description_array[1]
      # byebug
      new_stage = StoryStage.new(stage: stage, body: body, button: button_txt, nextStep: next_step, description: description, pic_id: 1)
      new_stage.save
    end
  end
end


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
