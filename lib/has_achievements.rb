module HasAchievements #:nodoc:
  
  def self.included(base)
    base.extend(HasManyMacro)
  end
  
  
  
  module HasManyMacro
    def has_achievements(options={})
      include InstanceMethods
      extend ClassMethods
    end
  end # HasManyMacro
  
  
  
  module ClassMethods
    # Get all achievements for class
    def achievements
      read_inheritable_attribute(:achievements) || write_inheritable_attribute(:achievements, {})
    end
    
    # Add achievement to class's achievements hash
    def achievement(title, options={}, &hook)
      hook_method_name   = "#{title}_hook"
      hooked_achievement = HookedAchievement.new(title, hook_method_name, options)
      
      # Add hook method to model
      define_method(hook_method_name, &hook)
      
      write_inheritable_hash(:achievements, title => hooked_achievement)
    end
  end # ClassMethods
  
  
  
  module InstanceMethods
    
  end # InstanceMethods
  
  
  
  # Grabs achievements defined from model and maps to hook method name
  class HookedAchievement
    attr_reader :id, :title, :value, :hook_method, :model_class_name
    
    def initialize(title, hook_method, options={})
      if achievement = Achievement.find_by_title(title.to_s.gsub(/_id$/, "").gsub(/_/, " ").capitalize)
        @id          = achievement.id
        @title       = achievement.title
        @value       = achievement.value
        @hook_method = hook_method
      else
        raise "Model has achievement '#{title}' that does not exist in achievements db table. Make sure a achievement with the title of '#{title.to_s.gsub(/_id$/, "").gsub(/_/, " ").capitalize}' exists before defining in model."
      end
    end
  end # AchievementItem
  
  
  
end # HasAchievements