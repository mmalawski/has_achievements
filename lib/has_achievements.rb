module HasAchievements
  
  def self.included(base)
    base.extend(HasManyMacro)
  end
  
  module HasManyMacro
    def has_achievements(options={})
      # pending
    end
  end
  
end