require 'rails_helper'

feature 'unauthenticated user' do

  scenario "is redirected to sign up page and can create account" do
    visit '/'
    expect(current_path).to eq('/signup')

    fill_in "Email", with: "horace@turing.io"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Welcome, horace@turing.io"
  end

  scenario "can't create account with existing email" do
    User.create!(email: "horace@turing.io",
                 password: "password")

    visit '/'
    expect(current_path).to eq('/signup')

    fill_in "Email", with: "horace@turing.io"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(current_path).to eq('/signup')
    expect(page).to have_content "Email has already been taken"
  end
end
