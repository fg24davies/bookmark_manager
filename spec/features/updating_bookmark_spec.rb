require 'spec_helper'
require 'pg'

feature 'updating bookmarks ' do
  scenario 'user is able to update a specified bookmark' do 

    bookmark = Bookmark.add(url: 'https://httpstatusdogs.com/', title: 'Dogs')
    Bookmark.add(url: 'http://www.twitter.com', title: 'Twitter')
    visit '/bookmarks'
    expect(page).to have_link('Dogs', href: 'https://httpstatusdogs.com/')
    first('.bookmark').click_on 'update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

    fill_in 'url', with: 'https://http.cat/'
    fill_in 'title', with: 'Cats'
    click_button('submit')
    # expect(current_path).to eq '/bookmarks' # I think this line is checking that we will have the correct redirection
    
    expect(page).not_to have_link('Dogs' , href: 'https://httpstatusdogs.com/')
    # expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    expect(page).to have_link('Cats', href: 'https://http.cat/')
  end
end
