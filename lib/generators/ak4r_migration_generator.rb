require 'rails/generators'
require 'rails/generators/migration'

class Ak4rMigrationGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc 'Creates a new migration for Ak4r API keys'

  def self.source_root
    File.expand_path('../templates', __FILE__)
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
      migration_number += 1
      migration_number.to_s
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_ak4r_api_key.rb'
  end
end
