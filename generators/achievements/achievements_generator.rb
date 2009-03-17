class AchievementsGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'achievements_migration.rb', 'db/migrate', :migration_file_name => "create_achievement_tables"
    end
  end
end