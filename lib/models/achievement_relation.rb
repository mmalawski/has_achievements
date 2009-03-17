class AchievementRelation < ActiveRecord::Base
  
  # RELATIONS
  belongs_to :item, :polymorphic => true
  has_one :achievement
  
  
  # VALIDATIONS
  validates_presence_of :achievement_id
  validates_presence_of :item_id
  validates_presence_of :item_type
  
end