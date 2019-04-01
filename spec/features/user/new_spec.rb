require "rails_helper"

describe "visitor on homepage" do
  it "can create user account" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq(new_user_path)

    fill_in "User Name", with: "John"
    fill_in "Password", with: "password1234"

    click_on "Create User"

    user = User.last
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
  end
end
