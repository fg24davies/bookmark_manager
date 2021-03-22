require 'pg'
class Bookmark 

  def initialize
    @bookmark_list = []
  end 

  def all 
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('SELECT url FROM bookmarks')
    result.each { |bookmark| bookmark.each {|url, website| @bookmark_list << website } }
    @bookmark_list
  end 

end 