require 'spec_helper'

feature 'there is a homepage' do
  scenario 'the user goes to the homepage and sees "Welcome to Bookmark Manager"' do
    visit '/'
    expect(page).to have_content('Welcome')
  end
end 