class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :characterName, :favFood, :firstJob, :favAnimal
end
