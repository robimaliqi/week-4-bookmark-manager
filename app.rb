require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'
require_relative './database_connection_setup'
require 'uri'
require 'sinatra/flash'
<<<<<<< HEAD
require_relative './lib/comment'
=======
require_relative './lib/user'

>>>>>>> d559454869502ccba1eceb2f1dd906c5186bb67e

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
    register Sinatra::Flash


  get '/' do
    'Bookmark Manager'
  end

  
  get '/bookmarks' do
    @user = User.find(id: session[:user_id])
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end


  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])

  get '/users/new' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/bookmarks'
  end


  run! if app_file == $PROGRAM_NAME
end