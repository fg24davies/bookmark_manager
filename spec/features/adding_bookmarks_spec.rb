require 'spec_helper'
require 'pg'

feature 'Add bookmarks' do

  scenario 'there is an add bookmarks button' do
    visit '/bookmarks'
    expect(page).to have_content("Your Bookmarks")
    expect(page).to have_button("Add Bookmark")
  end 

  scenario 'User can add to bookmarks to the bookmark manager' do
    visit '/bookmarks/new'
    fill_in 'url', with: 'http://www.netflix.com'
    fill_in 'title', with: 'Netflix'
    click_on 'Add Bookmark'
    expect(page).to have_link('Netflix', href: "http://www.netflix.com")
  end
end
