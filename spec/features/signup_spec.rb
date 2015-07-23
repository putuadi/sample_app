require "rails_helper"

RSpec.describe "User sign up", type: :feature do
  
  let(:custom_path) do
    "http://localhost:3000/signup"
  end

  it "should have sign up form" do
    visit custom_path
    expect(page).to have_field "user[name]" # assert for presence of an input field named user[name]
    expect(page).to have_field "user[email]" # assert for presence of an input field named user[email]
    expect(page).to have_field "user[password]" # assert for presence of an input field named user[password]
    expect(page).to have_field "user[password_confirmation]" # assert for presence of an input field named user[password_confirmation]
    expect(page).to have_button "Create User" # assert for presence of button commit
  end
    
  it "should create new user" do
    visit signup_path #use rails routing
    fill_in "user_name", with: "new user" # fill in text field with "new user"
    fill_in "user_email", with: "newuser@test.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User" # click button
    expect(page).to have_css "p", text: "User was successfully created."
  end
    
end