require 'sinatra/base'
require './lib/bookmark.rb'
require 'pg'

class BookmarkManager< Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks'do
    @bookmark_list = Bookmark.new.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    # url = params['bookmark']
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
    Bookmark.new.add(bookmark: (params[:bookmark]))
    redirect '/bookmarks'
  end

run! if app_file == $0

end
