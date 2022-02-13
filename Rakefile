# frozen_string_literal: true

require "sequel"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

require_relative "lib/frampt/const"

require "dotenv/load" unless Frampt::Const::PRODUCTION

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

namespace :db do
  Sequel.extension :migration

  task :migrate do
    Sequel.connect(ENV.fetch("DATABASE_CONNECTION_STRING")) do |db|
      Sequel::Migrator.run(db, "./db/migrations")
    end
  end

  task :version do
    Sequel.connect(ENV.fetch("DATABASE_CONNECTION_STRING")) do |db|
      puts db.tables.include?(:schema_info) ? db[:schema_info].first[:version] : 0
    end
  end
end
