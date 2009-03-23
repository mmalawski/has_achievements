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
    def achievement(title, options={})
      hook = {} # Just a test for now
      write_inheritable_hash(:achievements, title => hook)
    end
  end # ClassMethods
  
  
  module InstanceMethods
    
  end # InstanceMethods
  
end # HasAchievements