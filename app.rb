require 'sinatra/base'

class BookmarkManager< Sinatra::Base
enable :sessions

  get '/' do
    'Hello World'
  end

end

