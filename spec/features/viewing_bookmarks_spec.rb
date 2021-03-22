require 'spec_helper'

feature 'viewing bookmarks' do

  scenario 'view bookmarks button on index page ' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'View Bookmarks')
  end

  scenario 'see a list of bookmarks' do
    visit '/'
    click_on 'View Bookmarks'
    expect(page).to have_content("https://pomofocus.io/")
  end 

end 

