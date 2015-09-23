require 'rails_helper'

feature 'Logged in user' do

  scenario "can logout" do
    @user = User.create!(email: "horace@turing.io",
      password: "password",
      password_confirmation: "password")

    visit root_path
    expect(current_path).to eq('/signup')
    within("h1") do
      click_on "Login"
    end

    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Welcome, #{@user.email}"

    click_on "Logout"

    expect(current_path).to eq('/login')

    visit '/'

    expect(current_path).to eq('/signup')
  end
end
