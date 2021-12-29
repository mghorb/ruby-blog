class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.where('title ILIKE ?', params[:title])
    render json: @tags, status: 200
  end

  def show
    @tag = Tag.where(id: params[:id])
    if @tag
      render json: @tag, status: 200
    else
      render json: {error: "Tags not found."}
    end
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: 200
    else
      render json: {error: @tag.errors.full_messages.first}, status: 422
    end
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      render json: @tag, status: 200
    else
      render json: {error: @tag.errors.full_messages.first}, status: 422
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    render nothing: true, status: 204
  end

  private
    def tag_params
      params.require(:tag).permit(:title, :count)
    end
end

