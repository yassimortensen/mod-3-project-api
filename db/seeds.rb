# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pic.create(picUrl: 'www.blah.com')
StoryStage.create(pic: Pic.last)
User.create!
UserStory.create(user: User.last, story_stage: StoryStage.last)
