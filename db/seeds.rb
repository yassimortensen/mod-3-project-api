# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
StoryStage.create(id: nil, stage: 1, body: "monster looks ugly", button: "Run", nextStep: nil, description: "Walk down the trail", pic_id: 1, created_at: nil, updated_at: nil)
StoryStage.create(id: nil, stage: 1, body: "it's dark", button: "Hide", nextStep: nil, description: "See a Monster", pic_id: 1, created_at: nil, updated_at: nil)
StoryStage.create(id: nil, stage: 1, body: "you're cold", button: "Fight", nextStep: nil, description: "The trail behind you is clear", pic_id: 1, created_at: nil, updated_at: nil)
