require 'pg'
require_relative './database_connection.rb'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks') # this is a PG object
    result.map { |bookmark| # the object is an array of hashes with contain a row from the database
    # the hash keys are the column names and the values their values
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
  }
  # ^^^^^ we take the values from the hash and put them in a new Bookmark object.
  end

  def self.add(url:, title:)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}';")
  end 

  def self.update(title:, url:, id:)
    result = DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = '#{id}' RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end 


end
