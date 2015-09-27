class CommentsController < ApplicationController

  include CommentsHelper

  before_filter :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    
    if @comment.save
      flash.notice = "Posted Comment!"

      redirect_to article_path(@comment.article)
    end
  end

end
