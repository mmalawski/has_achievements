require 'has_achievements'
require 'models/achievement'
require 'models/achievement_relation'

ActiveRecord::Base.send(:include, HasAchievements)