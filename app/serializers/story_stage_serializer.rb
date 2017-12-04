class StoryStageSerializer < ActiveModel::Serializer
  attributes :id, :stage, :body, :button, :nextStep, :description, :picId
end
