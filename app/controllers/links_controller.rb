class LinksController < ApplicationController
  before_filter :authorize

  def index
    @read_links = current_user.links.where(status: 1)
    @unread_links = current_user.links.where(status: 0)
  end

  def create
    link = Link.new(link_params)
    if link.valid?
      current_user.links << link
      render partial: "links/link", locals: {link: link}
    else
      flash.now[:errors] = "Invalid link!"
    end
  end

  def update
    link = Link.find(params[:id])
    link.status == "unread" ? link.status = "read" : link.status = "unread"
    link.save!
    render partial: "links/link", locals: {link: link}
  end

  private

  def link_params
    params.require(:link).permit(:url, :status)
  end
end
