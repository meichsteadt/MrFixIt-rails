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
  it "signs you up" do
    user = User.create(email: 'email@email.com', password: 'password')
    login_as(user, scope: :user)
    visit new_worker_path
    expect(page).to have_content 'Sign up'
  end
  it "throws an error if you are trying to do something without being authenticated" do
    visit new_job_path
    expect(page).to have_content 'You must be logged in'
  end
end
