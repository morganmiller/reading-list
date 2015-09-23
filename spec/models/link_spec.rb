require 'rails_helper'

RSpec.describe Link, type: :model do
  it "has a default status of unread" do

  end

  it "knows the correct text to render for updating status" do
    link = Link.create!(url:"http://www.producthunt.com/tech/ubercommute")
  end

  it ""
end
