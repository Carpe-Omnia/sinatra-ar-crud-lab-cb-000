
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
    chad = Post.create(title: params["title"], content: params["content"])
    @articles = Post.all
    erb :index
  end

  get '/articles' do
    @articles = Post.all
    erb :index
  end

  get 'articles/:id' do
    @article = Post.find(params[:id])
    erb :show
  end

  get 'articles/:id/edit' do
    @article = Post.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    article = Post.find(params[:id])
    article.update(name: params["name"], content: params["content"])
    erb :index
  end

  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.delete
    @articles = Article.all
    erb :index
  end

end
