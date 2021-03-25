require './lib/bookmark.rb'
# require 'pg'

describe Bookmark do

  describe '.all' do
    it 'shows all bookmarks in the list' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
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
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
     
      expect(bookmark).to be_a Bookmark
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end

end
