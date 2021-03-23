require 'pg'

class Bookmark

  @bookmark_list = []

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT url FROM bookmarks')
    result.each { |bookmark| bookmark.each {|url, website| @bookmark_list << website } }
    @bookmark_list
  end

  def self.add(bookmark:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}');")
  end
end
