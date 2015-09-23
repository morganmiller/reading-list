class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = current_user.links.all
  end

  def create
    link = Link.new(link_params)
    if link.valid?
      current_user.links << link
      redirect_to '/'
    else
      flash[:errors] = "Invalid link!"
      redirect_to '/'
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
