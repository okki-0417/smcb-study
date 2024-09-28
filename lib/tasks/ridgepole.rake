# frozen_string_literal: true

require "ridgepole"

namespace :ridgepole do
  task :apply do
    options = [
      "--apply",
      "--ignore-tables repli_clock,convert_statuses",
      "--file db/schemas/Schemafile"
  ]
    exec_ridgepole(options)
  end

  def exec_ridgepole(options)
    default_options = [
      "--config #{Rails.root}/config/database.yml",
      "--spec-name primary",
      "--allow-pk-change"
    ]
    sh("bundle exec ridgepole #{default_options.join(' ')} #{options.join(' ')} --env development")
    sh("bundle exec ridgepole #{default_options.join(' ')} #{options.join(' ')} --env test")
  end
end
