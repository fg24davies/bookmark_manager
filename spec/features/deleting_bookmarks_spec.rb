require 'spec_helper'
require 'pg'

feature 'delete bookmark' do
  scenario 'user is able to delete a specific bookmark' do 
    Bookmark.add(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.add(url: 'https://httpstatusdogs.com/', title: 'Dogs')
    visit '/bookmarks'
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    first('.bookmark').click_on 'delete'
    expect(current_path).to eq '/bookmarks' # I think this line is checking that we will have the correct redirection
    expect(page).to have_link('Dogs' , href: 'https://httpstatusdogs.com/')
    expect(page).not_to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
