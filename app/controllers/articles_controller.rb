class ArticlesController < ApplicationController

  include ArticlesHelper

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])    
  end


  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash.notice = "Created '#{@article.title}', woohoo!"

      redirect_to article_path(@article)
    end
  end


  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Removed '#{@article.title}'."
    redirect_to articles_path
  end

end
