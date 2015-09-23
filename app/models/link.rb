require 'pismo'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true, url: true
  before_save :set_title

  enum status: %w(unread read)

  def update_text
    self.status == "unread" ? "Mark read" : "Mark unread"
  end

  private

  def set_title
    page = Pismo::Document.new(url)
    self.title = page.title
  end
end
