class TagsController < ApplicationController

  before_filter :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end
  

  def show
    @tag = Tag.find(params[:id])
  end


  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    Tagging.where(tag_id: tag.id).find_each do |tagging|
      tagging.destroy
    end

    flash.notice = "Removed #{tag.name}."
    redirect_to tags_path
  end

end
