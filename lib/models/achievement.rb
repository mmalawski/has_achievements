class Achievement < ActiveRecord::Base
  
  # RELATIONS
  belongs_to :achievement_relation
  
  
  # VALIDATIONS
  validates_presence_of :title
  
end