require 'spec_helper'
require 'pg'

feature 'viewing bookmarks' do
  # scenario 'view bookmarks button on index page ' do
  #   visit '/'
  #   expect(page).to have_selector(:link_or_button, 'View Bookmarks')
  # end

  scenario 'see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.twitter.com', 'Twitter');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
    visit '/bookmarks'
    expect(page).to have_content("Twitter")
  end
end

