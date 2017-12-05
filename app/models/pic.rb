class Pic < ApplicationRecord
  has_many :story_stages
  #put in place for paperclip, ignore for now
  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", accessorysize: "200x200>", outerwearsize: "300x300>", topsize: "300x300>", bottomsize: "250x250>", shoesize: "200x200>"}, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
