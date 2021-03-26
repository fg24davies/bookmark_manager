require 'pg'
require_relative '../lib/database_connection.rb'

# p "Setting up test database.."

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end


def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks RESTART IDENTITY;")
end