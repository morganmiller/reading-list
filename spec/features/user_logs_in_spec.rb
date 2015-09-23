require 'rails_helper'

feature 'Unauthenticated user' do

  scenario "is redirected to signup page and can find login" do
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
  end

  scenario "can't login with invalid credentials" do
    visit root_path
    expect(current_path).to eq('/signup')
    within("h1") do
      click_on "Login"
    end

    fill_in "Email", with: "doesn't@exist.com"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq('/login')
    expect(page).to have_content "Invalid Login"
  end
end
