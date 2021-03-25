require 'spec_helper'
require 'pg'

feature 'Add bookmarks' do
  scenario 'User can add to bookmarks to the bookmark manager' do
    visit '/bookmarks/new'
    fill_in 'url', with: 'http://www.netflix.com'
    fill_in 'title', with: 'Netflix'
    click_on 'Add Bookmark'
    expect(page).to have_link('Netflix', href: "http://www.netflix.com")
  end
end