class LinksController < ApplicationController
  before_filter :authorize
  belongs_to :user

  def index
    @links = current_user.links.all
  end
end
