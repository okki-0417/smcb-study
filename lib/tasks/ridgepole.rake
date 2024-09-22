# frozen_string_literal: true

require "ridgepole"

namespace :ridgepole do
  task :apply do
    sh "ridgepole --config ./config/database.yml --file db/schemas/Schemafile --apply"
  end
end
