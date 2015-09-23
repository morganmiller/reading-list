require 'pismo'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, url: true
  default_scope { order(status: :asc) }

  enum status: %w(unread read)

  def update_text
    self.status == "unread" ? "Mark read" : "Mark unread"
  end

  def title
    page = Pismo::Document.new(url)
    page.title
  end
end
