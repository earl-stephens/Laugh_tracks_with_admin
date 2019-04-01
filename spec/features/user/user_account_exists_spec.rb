require "rails_helper"

describe "a registered user" do
  it "can log in" do
    user = User.create(username: "John", password: "password1234")
    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_content("Log out")
  end

  it "can log out" do
    user = User.create(username: "John", password: "password1234")
    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_content("Log out")

    click_on "Log out"

    expect(current_path).to eq(root_path)
    
  end
end
