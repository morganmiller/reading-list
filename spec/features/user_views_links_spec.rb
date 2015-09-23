require 'rails_helper'

feature 'Authenticated user' do
  self.use_transactional_fixtures = false

  scenario "can add links", js: true do
    visit '/signup'
    fill_in "Email", with: "me@turing.io"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(current_path).to eq(root_path)

    fill_in 'link-url', with: "http://turing.io"
    click_on "Save link"

    within("#unread") do
      expect(page).to have_content "http://turing.io"
      expect(page).to have_content "unread"
      expect(page).to have_link "Mark read"
    end
  end

  scenario "can mark as read and unread", js: true do
    visit '/signup'
    fill_in "Email", with: "me@turing.io"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(current_path).to eq(root_path)

    fill_in 'link-url', with: "http://turing.io"
    click_on "Save link"

    within("#unread") do
      click_link "Mark read"
    end

    within("#read") do
      expect(page).to have_content "http://turing.io"
      expect(page).to have_link "Mark unread"
    end
  end
end
