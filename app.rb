require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # The code here is executed when a request is received,
    # and need to send a response. 

    # We can simply return a string which
    # will be used as the response content.
    # Unless specified, the response status code
    # will be 200 (OK).
    return 'Some response data'
  end  

  get '/hello' do
    return erb(:hello)
  end

  post '/submit' do
    "Thanks #{params[:name]}, you sent this message: \"#{params[:message]}\""
  end

  get '/names' do
    "Julia, Mary, Karim"
  end

  post '/sort-names' do
    params[:names].split(',').sort.join(',')
  end
end