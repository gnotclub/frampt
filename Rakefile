# frozen_string_literal: true

require "logger"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

require_relative "lib/frampt/const"

require "dotenv/load" unless Frampt::Const::PRODUCTION

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :environment do
  # https://api.rubyonrails.org/classes/ActiveRecord/Tasks/DatabaseTasks.html
  RAKE_PATH = File.expand_path('.')
  RAKE_ENV  = ENV.fetch('APP_ENV', 'development')
  ENV['RAILS_ENV'] = RAKE_ENV

  Bundler.require :default, RAKE_ENV

  ActiveRecord::Tasks::DatabaseTasks.database_configuration = ActiveRecord::Base.configurations
  ActiveRecord::Tasks::DatabaseTasks.root             = RAKE_PATH
  ActiveRecord::Tasks::DatabaseTasks.env              = RAKE_ENV
  ActiveRecord::Tasks::DatabaseTasks.db_dir           = 'db'
  ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ['db/migrations']
  ActiveRecord::Tasks::DatabaseTasks.seed_loader      = OpenStruct.new(load_seed: nil)
end

load "active_record/railties/databases.rake"
