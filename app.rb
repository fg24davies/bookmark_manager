require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager< Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks'do 
    @bookmark_list = Bookmark.all
    erb :bookmarks
  end 

end

