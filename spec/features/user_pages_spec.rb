require 'rails_helper'

describe "sign-up process" do
  it "signs you up" do
    visit root_path
    click_link "Sign-up as a Worker"
    fill_in "worker[email]", :with => 'email@email.com'
    fill_in "worker[password]", :with => 'password'
    fill_in "worker[password_confirmation]", :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Worker Dashboard'
  end
end
