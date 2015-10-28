# TODO: Send correct codes, render errors.
class LinksController < ApplicationController
  def index
    @links = Link.by_date
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: @links }
    end
  end

  def create
    @link = Link.create!(link_params)
    render json: @link
  end

  def update
    @link = Link.find(params[:id])
    @link.update!(link_params)
    render json: @link
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy!
    render json: {}, status: :no_content
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :tags)
  end
end
