class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = current_user.links.all
  end
end
