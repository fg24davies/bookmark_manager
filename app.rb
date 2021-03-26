require 'sinatra/base'
require './lib/bookmark.rb'
require 'pg'
require 'setup_test_database'

class BookmarkManager < Sinatra::Base
enable :sessions, :method_override

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks'do
    @bookmark_list = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end 

  get '/bookmarks/:id/update' do
    @bookmark_id = params[:id]
    erb :'bookmarks/update'
  end 

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end 

run! if app_file == $0

end
