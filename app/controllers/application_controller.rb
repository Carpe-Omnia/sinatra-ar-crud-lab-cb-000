
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    chad = Post.create(name: params["name"], content: params["content"])
    @articles = Post.all
    erb :posts
  end

  get '/posts' do
    @articles = Post.all
    erb :posts
  end

  get 'posts/:id' do
    @article = Post.find(params[:id])
    erb :show
  end

  get 'posts/:id/edit' do
    @article = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    article = Post.find(params[:id])
    article.update(name: params["name"], content: params["content"])
    erb :posts
  end

  delete '/posts/:id' do
    article = Post.find(params[:id])
    article.delete
    @articles = Post.all
    erb :posts
  end

end
