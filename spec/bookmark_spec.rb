require './lib/bookmark.rb'

describe Bookmark do 
bookmarks_test = Bookmark.new.all
it '#all' do 
    expect(bookmarks_test).to include "http://www.twitter.com"
    expect(bookmarks_test).to include "http://www.google.com"
  end 

end 
