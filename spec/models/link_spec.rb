require 'rails_helper'

RSpec.describe Link, type: :model do
  it "has a default status of unread" do
    link = Link.create!(url:"http://www.producthunt.com/tech/ubercommute")

    expect(link.status).to eq("unread")
  end

  it "knows the correct text to render for updating status" do
    link = Link.create!(url:"http://www.producthunt.com/tech/ubercommute")

    expect(link.update_text).to eq("Mark read")
  end

  it "sets a title before save" do
    link = Link.create!(url:"http://www.producthunt.com/tech/ubercommute")

    expect(link.title).to eq("uberCOMMUTE: Carpooling at the press of a button | Product Hunt")
  end
end
