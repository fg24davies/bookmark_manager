require 'sinatra/base'
require './lib/bookmark.rb'
require 'pg'

class BookmarkManager < Sinatra::Base
enable :sessions

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks'do
    @bookmark_list = Bookmark.all
    # p "--------"
    # p @bookmark_list
    # p "--------"
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

run! if app_file == $0

end
