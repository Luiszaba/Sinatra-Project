require_relative './config/environment'
require_relative 'app/controllers/application_controller'
require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use StoriesController
use UsersController
run ApplicationController