def story_stage()
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
        description.sub! 'and firm hand with a gravy pan', ''
        description.sub! 'Hot Pie', '`${characterName}`'
        description.sub! 'gravy man', '`${firstJob}`'
        description.sub! 'But on the bright side, they really enjoy how you taste with the gravy you left simmering.', ''
        description.sub! 'another batch of gravy for the evening dinner rush', '`${favFood}` for dinner'
        description.sub! 'old gravy pan,', 'old pan,'
        description.sub! 'without gravy,', 'without #{favFood}'
        description.sub! 'teetering on the edge of gravy', 'teetering on the edge of #{favFood}'
        description.sub! 'It enjoys the gravy so', 'It enjoys the #{favFood} so'
        description.sub! 'good dollop of gravy.', 'good dollop of #{favFood}.'
        body.gsub! 'gravy', '`${favFood}`'
        body.sub! 'GRAVY', '`${favFood}`'
        button_txt.sub! 'gravy', 'food'
        next_step.sub! 'gravy', 'food'
        button_txt.sub! 'Gravy', 'food'
        next_step.sub! 'Gravy', 'food'
        stage.sub! 'gravy', 'food'
        stage.gsub! 'Gravy', 'food'
        description.gsub! 'gravy', '`${favFood}`'
        if stage != 'comments' && button_txt != 'comments'
          # byebug
          new_stage = StoryStage.new(stage: stage, body: body, button: button_txt, nextStep: next_step, description: description, pic_id: 0)
          new_stage.save
        end
      end
    end
  end
end

def pics
  pics_yay = {
  "0":"http://78.media.tumblr.com/e5d6765ef04c7b826f997326f07cb5b1/tumblr_n22a7oay3c1tuzdqso1_540.jpg",
  "1":"http://78.media.tumblr.com/39fea54f34f95e2a0cf180050da11c3b/tumblr_n215h4HICw1tuzdqso1_540.jpg",
  "2":"http://78.media.tumblr.com/ea4037ae74d702f930b327361bf6404b/tumblr_n215mcUwlS1tuzdqso1_540.jpg",
  "3":"http://78.media.tumblr.com/6b939ad9b10c7831ebf189ef5609419b/tumblr_n215piTESe1tuzdqso1_540.jpg",
  "4":"http://78.media.tumblr.com/dcaaadde66a8f2e48fa29af0d7c5116f/tumblr_n215rrn4eN1tuzdqso1_540.jpg",
  "5":"http://78.media.tumblr.com/e7f3d9fcba228813320bd1a8913fa5f3/tumblr_n2bw29tsTd1tuzdqso1_540.jpg",
  "6":"http://78.media.tumblr.com/902b19d72fb65bd0c930ee419a7a5d01/tumblr_n215taMZH51tuzdqso1_540.jpg",
  "7":"http://78.media.tumblr.com/8f2ca6fcb55358d4f9280e9d36ea4161/tumblr_n2bxwbDpOj1tuzdqso1_540.jpg",
  "8":"http://78.media.tumblr.com/44ac8bbf48f3efe938da419701e4523a/tumblr_n2bxxtgHok1tuzdqso1_540.jpg",
  "9":"http://78.media.tumblr.com/5c77f113038d95a3d9f1760ced6901ae/tumblr_n2bxzbKXDa1tuzdqso1_540.jpg",
  "10":"http://78.media.tumblr.com/49286222abce471d572738dad75d89c4/tumblr_n2k29l8RC71tuzdqso1_540.jpg",
  "11":"http://78.media.tumblr.com/70e03d95f5c81a8f94d3c976bb533c9a/tumblr_n2k2dpYM4i1tuzdqso1_540.jpg",
  "12":"http://78.media.tumblr.com/156ebadd8675309c1b05b2cf545fd2f2/tumblr_n2k2eqXUro1tuzdqso1_540.jpg",
  "13":"http://78.media.tumblr.com/10f3dcf6a3b8359d697cdba935e8dcfd/tumblr_n2k2lr7wKj1tuzdqso1_540.jpg",
  "14":"http://78.media.tumblr.com/d214cb8f903bb8c1543d8a35daa49140/tumblr_n215usiHwm1tuzdqso1_540.jpg",
  "15":"http://78.media.tumblr.com/0aad434c1a026d263013f77e1a3ce9c6/tumblr_n2rebhzbEC1tuzdqso1_r1_540.jpg",
  "16":"http://78.media.tumblr.com/28afed18d70b6a14896bf9a7ad424cbe/tumblr_n2reeiwd2g1tuzdqso1_r1_540.jpg",
  "17":"http://78.media.tumblr.com/d5a46c43c0f7294d666f1706fe6364e2/tumblr_n2reg6bGMC1tuzdqso1_r1_540.jpg",
  "18":"http://78.media.tumblr.com/da3e5e26aca57bb72e00973344ef1804/tumblr_n2rei7ipLI1tuzdqso1_r1_540.jpg",
  "19":"http://78.media.tumblr.com/da5b9cd46d8f9100407cb75766b774e5/tumblr_n307rng2tL1tuzdqso1_540.jpg",
  "20":"http://78.media.tumblr.com/6689baa6135a0f553390355b2bd6fda9/tumblr_n30hth1Bzb1tuzdqso1_540.jpg",
  "21":"http://78.media.tumblr.com/e3f1f4aeb76a5d08701e12ff17159c0d/tumblr_n30i02FoAB1tuzdqso1_540.jpg",
  "22":"http://78.media.tumblr.com/c8ae8fb5a23f270614d649d73387ec74/tumblr_n32348p2Kl1tuzdqso1_540.jpg",
  "23":"http://78.media.tumblr.com/5cc908247625f62f9b3fa421c0d8a1b2/tumblr_n348biOp1S1tuzdqso1_540.jpg",
  "24":"http://78.media.tumblr.com/79afa015dffb0e58bb7950d33486f7f8/tumblr_n383z85C1v1tuzdqso1_540.jpg",
  "25":"http://78.media.tumblr.com/43175fe8787691574f9c067012669e11/tumblr_n2163vrcRa1tuzdqso1_540.jpg",
  "26":"http://78.media.tumblr.com/b9b7d0a7a2c194cb93421d7a685f4482/tumblr_n3841dlvZR1tuzdqso1_540.jpg",
  "27":"http://78.media.tumblr.com/b094e1190d252de33ea60ee676316861/tumblr_n3cw63yvut1tuzdqso1_540.jpg",
  "28":"http://78.media.tumblr.com/37dfbfe2d9ed8f40a8a5896000a3696f/tumblr_n3cw871t6j1tuzdqso1_540.jpg",
  "29":"http://78.media.tumblr.com/773e6e5ade437d65618b77eb2c3f1cd5/tumblr_n3f2joeCoT1tuzdqso1_540.jpg",
  "30":"http://78.media.tumblr.com/a45064c623ee80c355da1c76f772b9f6/tumblr_n3qgwvWcDQ1tuzdqso1_540.jpg",
  "31":"http://78.media.tumblr.com/dba1c1789807ac77a3c869a763a94a14/tumblr_n46zjnvSLN1tuzdqso1_540.jpg",
  "32":"http://78.media.tumblr.com/723a81e6751eeaaf303835ab0a47169a/tumblr_n4r8fx79dC1tuzdqso1_400.jpg",
  "33":"http://78.media.tumblr.com/5c065625c636694f96d5ea1e95069784/tumblr_n4wp3uQftB1tuzdqso1_r3_540.jpg",
  "34":"http://78.media.tumblr.com/79dfc49e8c99b2a1986816953f7fe9d0/tumblr_n59vmruKyE1tuzdqso1_540.jpg",
  "35":"http://78.media.tumblr.com/7b6b2f6f9627793cd38cd12c81c139ea/tumblr_n5msmvD7i31tuzdqso1_540.jpg",
  "36":"http://78.media.tumblr.com/3df976c905f44ce3589aef2b7776b9a6/tumblr_n5zt02gH9z1tuzdqso1_540.jpg",
  "37":"http://78.media.tumblr.com/c4c0d12a801144dba611448e437e4913/tumblr_n6ptx5PPgk1tuzdqso1_540.jpg",
  "38":"http://78.media.tumblr.com/4c23eb6b884073ddea4549ddd99b1456/tumblr_n7431prGqX1tuzdqso1_540.jpg",
  "39":"http://78.media.tumblr.com/4a7a6e6c60e219b2d8a07acb673d06a3/tumblr_n7hahbIOI31tuzdqso1_540.jpg",
  "40":"http://78.media.tumblr.com/634be8ceb94200b4c86f6e2d3cbcb09c/tumblr_nmyoisXMnO1tuzdqso1_540.jpg",
  "41":"http://78.media.tumblr.com/4ab7ac122e2195ed89bedb65a22e7193/tumblr_nnbeklk9d21tuzdqso1_540.jpg",
  "42":"http://78.media.tumblr.com/6cccc181fc8cd663256b41f355943fa5/tumblr_nnoi962LH61tuzdqso1_540.jpg",
  "43":"http://78.media.tumblr.com/8f927b6a238aa6f81a8d678e1128e63a/tumblr_no043m0hgU1tuzdqso1_540.jpg",
  "44":"http://78.media.tumblr.com/b1dd91654ac7a6faeb10a105c758d2d9/tumblr_noefxter2H1tuzdqso1_540.jpg",
  "45":"http://78.media.tumblr.com/3d8048b5ce689f179cd2299c54e5e370/tumblr_noreb9xBIF1tuzdqso1_540.jpg",
  "46":"http://78.media.tumblr.com/ee6083003bca4269d13ac2647c281df4/tumblr_np34fy1zQj1tuzdqso1_540.jpg",
  "47":"http://78.media.tumblr.com/0e0f2afe788b3374be8577639a79a7f1/tumblr_npha3xDMOg1tuzdqso1_540.jpg",
  "48":"http://78.media.tumblr.com/cff15390797a22064509e2ffeadb950a/tumblr_npubfyZl2o1tuzdqso1_540.jpg",
  "49":"http://78.media.tumblr.com/95e71fc439b16610c49dc751b83cf409/tumblr_nq7j03vK0l1tuzdqso1_540.jpg",
  "50":"http://78.media.tumblr.com/63ff74c70b3ceae2064dd526d462c43f/tumblr_o6enauclQb1tuzdqso1_540.jpg",
  "51":"http://78.media.tumblr.com/d521c100cd71360b5afddd8b8e9ed206/tumblr_o6rgp2vmpb1tuzdqso1_540.jpg",
  "52":"http://78.media.tumblr.com/258bb296de23c5cc64e5547a6c78db96/tumblr_o74eqiPoqy1tuzdqso1_540.jpg",
  "53":"http://78.media.tumblr.com/26fb32c5c7268c91ae5d5b24f91ef88e/tumblr_o7hkxx1WKC1tuzdqso1_540.jpg",
  "54":"http://78.media.tumblr.com/bcca9f7e0f54ef18b903b21a03b31f4f/tumblr_o7uk3c8lwG1tuzdqso1_540.jpg",
  "55":"http://78.media.tumblr.com/08790c9f2008b1fb72b2edf64b06b877/tumblr_o87istlFIs1tuzdqso1_540.jpg",
  "56":"http://78.media.tumblr.com/2a77ba1ca95abb711efd6172a68b3507/tumblr_o8kidrRTGu1tuzdqso1_540.jpg",
  "57":"http://78.media.tumblr.com/cc6b9025624df578d41c43e7a40558f8/tumblr_o8xik6YKzp1tuzdqso1_540.jpg",
  "58":"http://78.media.tumblr.com/5883a24c29459fe044b899d9a7722ecb/tumblr_o9af7hj6vy1tuzdqso1_540.jpg",
  "59":"http://78.media.tumblr.com/e2cc43d78eb11b17e2a70477187dcf94/tumblr_o9niccA4WV1tuzdqso1_540.jpg",
  "60":"http://78.media.tumblr.com/32d077be79807633f4e108774c15c204/tumblr_otemmtUDbu1tuzdqso1_540.jpg",
  "61":"http://78.media.tumblr.com/efea850f7fe4ad77ed9ecfd1a873bf3b/tumblr_ottfnrmzCw1tuzdqso1_540.jpg",
  "62":"http://78.media.tumblr.com/d162f6235bff02a0f91f13fc04f04a39/tumblr_ou6qioIWKN1tuzdqso1_540.jpg",
  "63":"http://78.media.tumblr.com/fbad4a8529bca2e6119d82622662a4b1/tumblr_ouksoh2AWc1tuzdqso1_540.jpg",
  "64":"http://78.media.tumblr.com/36cfbec97626229b80fc9f88cbb28723/tumblr_ouvyobh7r61tuzdqso1_540.jpg",
  "65":"http://78.media.tumblr.com/8ca73a42a5f8b2f03d3f72afda8bc932/tumblr_ov9aga1w5j1tuzdqso1_540.jpg",
  "66":"http://78.media.tumblr.com/d54ca3d5f68fc3097277b89d3fd44055/tumblr_ovm7ku7GBB1tuzdqso1_540.jpg"}
  pics_yay.values.each do |pic|
    new_pic = Pic.new(picUrl: pic)
    new_pic.save
  end
end

def story_pics
  id = 1
  StoryStage.all.each do |story|
      story.pic_id = id
      story.save
      id += 1
    # byebug
  end
end

2.times do

  pics()
end

story_stage()
# story_pics()


# description.sub! 'gravy', '#{favFood}'
# description.sub! 'without spilling a drop', 'with ease'
# description.sub! 'pan of gravy', 'pan of #favFood'
# description.sub! 'filled with love, gravy, and dragons.', 'filled with love, #{favFood}, and dragons'
# description.sub! 'cooking of gravy', 'cooking of #{favFood}'
# description.sub! 'perfecting your gravy', 'perfecting your #{favFood}'
# description.sub! 'enjoy the gravy.', 'enjoy the #{favFood}'
# description.sub! 'unimpressed with your gravy,', 'unimpressed with your #{favFood},'
# description.sub! 'pies and gravy,', 'pies and #{favFood},'
# description.sub! 'proper materials to make gravy,', 'proper materials to make #{favFood},'
# description.sub! 'signature gravy and wolf pies.', 'signature #{favFood} and wolf pies.'
# description.sub! 'joy of gravy,', 'joy of #favFood,'
# description.sub! 'gravy and wolf pie,', '#{favFood} and wolf pie,'
# description.sub! 'You realize that you are still carrying your pan of gravy.', 'You realize that you are still carrying your pan of #{favFood}.'
# description.sub! 'to do with the pan of gravy that youre still carrying.', 'to do with the pan of #{favFood} that youre still carrying.'
