class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.joins(:articles).where(id: params[:id])
    render json: @tags, status: 200
  end

  def new
    @tag = Tag.new
  end

  def show
    @tags = Tag.all
    if @tags
      render json: @tags, status: 200
    else
      render json: {error: "Tags not found."}
    end
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: 200
    else
      render json: {error: "Tag not created."}
    end
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      render json: @tag, status: 200
    else
      render json: {error: "Tag cannot be updated."}
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    render json: "Tag deleted."
  end

  private
    def tag_params
      params.require(:tag).permit(:title, :count)
    end
end

