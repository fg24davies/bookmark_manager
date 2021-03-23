require './lib/bookmark.rb'
# require 'pg'

describe Bookmark do

  describe '.all' do
    it 'shows all bookmarks in the list' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.twitter.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      bookmarks_test = Bookmark.all
      expect(bookmarks_test).to include "http://www.twitter.com"
      expect(bookmarks_test).to include "http://www.google.com"
    end
  end

  describe '.add' do
    it 'adds a new bookmark to the bookmark list' do
      Bookmark.add(bookmark: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end
  end

end
