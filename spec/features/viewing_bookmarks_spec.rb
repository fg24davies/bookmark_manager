require 'spec_helper'
require 'pg'

feature 'viewing bookmarks' do
  scenario 'view bookmarks button on index page ' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'View Bookmarks')
  end

  scenario 'see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.twitter.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    visit '/bookmarks'
    expect(page).to have_content("http://www.twitter.com")
  end
end

feature 'Add bookmarks' do
  scenario 'User can add to bookmarks by saving url' do
    visit '/bookmarks/new'
    fill_in 'bookmark', with: 'http://www.netflix.com'
    click_on 'Add Bookmark'
    expect(page).to have_content("http://www.netflix.com")
  end
end
