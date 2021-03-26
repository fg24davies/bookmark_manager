require 'database_connection'
# require 'pg'

describe DatabaseConnection do 

  describe '.setup' do 
    it 'connects to a database' do 
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test').and_call_original
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end 

  describe '.connection' do
    it 'shows the connection' do
      spider = DatabaseConnection.setup('bookmark_manager_test')  
      expect(DatabaseConnection.connection).to eq spider
    end 
  end 

  describe '.query' do
    it 'executes that SQL query on the database' do 
        DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('http://twitter.com', 'Twitter') RETURNING id, title, url;") 
        bookmarks = Bookmark.all
        expect(bookmarks.first.title).to eq 'Twitter'
        expect(bookmarks.first.id).to eq "1"
        expect(bookmarks.first.url).to eq 'http://twitter.com'
    end
  end



end 
