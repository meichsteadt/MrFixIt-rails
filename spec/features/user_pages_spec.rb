require 'rails_helper'

describe "sign-up process" do
  it "signs you up" do
    visit root_path
    click_link "Sign-up to Post Jobs"
    fill_in "user[email]", :with => 'email@email.com'
    fill_in "user[password]", :with => 'password'
    fill_in "user[password_confirmation]", :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Log Out'
  end
end
