class Link < ActiveRecord::Base
  belongs_to :user

  enum status: %w(unread read)
end
