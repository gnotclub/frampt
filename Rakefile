# frozen_string_literal: true

require "logger"
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "active_record"
require "jwt"

require_relative "lib/frampt/const"
require_relative "db/models/Token"

require "dotenv/load" unless Frampt::Const::PRODUCTION

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

JWT_TOKEN_HMAC = ENV.fetch("TOKEN_HMAC")

task default: %i[spec rubocop]

task :environment do
  include ActiveRecord::Tasks
  # https://api.rubyonrails.org/classes/ActiveRecord/Tasks/DatabaseTasks.html
  rake_path = File.expand_path(".")
  rake_env  = ENV.fetch("APP_ENV", "development")
  ENV["RAILS_ENV"] = rake_env

  Bundler.require :default, rake_env

  ActiveRecord::Tasks::DatabaseTasks.database_configuration = ActiveRecord::Base.configurations
  ActiveRecord::Tasks::DatabaseTasks.root             = rake_path
  ActiveRecord::Tasks::DatabaseTasks.env              = rake_env
  ActiveRecord::Tasks::DatabaseTasks.db_dir           = "db"
  ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ["db/migrations"]
  ActiveRecord::Tasks::DatabaseTasks.seed_loader      = OpenStruct.new(load_seed: nil)
end

load "active_record/railties/databases.rake"


task create_root_token: :environment do
  payload = { ip_addr: "root" }
  jwt_token = JWT.encode(payload, JWT_TOKEN_HMAC, "HS512")
  Token.create token: jwt_token
end
