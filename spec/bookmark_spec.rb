require './lib/bookmark.rb'
# require 'pg'

describe Bookmark do

  describe '#all' do

    it '#all' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.twitter.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      bookmarks_test = Bookmark.new.all
      expect(bookmarks_test).to include "http://www.twitter.com"
      expect(bookmarks_test).to include "http://www.google.com"
    end
  end

  describe '.add' do
    it 'adds a new bookmark to the bookmark list' do
      Bookmark.new.add(bookmark: 'http://www.testbookmark.com')
      expect(Bookmark.new.all).to include 'http://www.testbookmark.com'
    end
  end

end
