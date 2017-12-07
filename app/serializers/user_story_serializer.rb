class UserStorySerializer < ActiveModel::Serializer
  attributes :id, :user, :story_stage

  def user
    {user_id: object.user.id}
  end

  def story_stage
    {
      story_stage_id: object.story_stage.id,
      stage: object.story_stage.stage,
      body: object.story_stage.body,
      nextStep: object.story_stage.nextStep
    }
  end
end
