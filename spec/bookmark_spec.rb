require './lib/bookmark.rb'
require 'setup_test_database.rb'
require 'spec_helper'

describe Bookmark do

  describe '.all' do
    it 'shows all bookmarks in the list' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark_test = Bookmark.add(url: "http://www.bbc.com", title: "BBC")
      bookmarks_test = Bookmark.all
      # have to call Bookmark.all to 'see' all the Bookmark objects that add creates
      # we could add more tests here and then change the following expects
      expect(bookmarks_test.length).to eq 1
      expect(bookmarks_test.first).to be_a Bookmark
      expect(bookmarks_test.first.id).to eq bookmark_test.id
      expect(bookmarks_test.first.title).to eq 'BBC'
      expect(bookmarks_test.first.url).to eq 'http://www.bbc.com'
    end
  end

  describe '.add' do
    it 'adds a new bookmark to the bookmark list' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end

  describe '.delete' do
    it 'deletes bookmark from the bookmark list' do
      bookmark = Bookmark.add(url: 'http://www.twitter.com', title: 'Twitter')
      Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')  
      Bookmark.delete(id: bookmark.id)
      
      expect(Bookmark.all.length).to eq 1
    end
  end 

  describe '.update' do 
    it 'updates a bookmark in the bookmark list' do
      bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark') 
      
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.test_complete_bookmark.com', title: 'Test Complete' )
      bookmarks = Bookmark.all
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Test Complete'
      expect(updated_bookmark.url).to eq 'http://www.test_complete_bookmark.com'
    end
  end 
end
