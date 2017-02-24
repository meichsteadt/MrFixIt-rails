require 'rails_helper'

describe "workers pages" do
  it "take you to the worker page" do
    worker = FactoryGirl.create(:worker)
    login_as(worker, scope: :worker)
    visit worker_path(worker)
    expect(page).to have_content 'Log Out'
  end

  it "will sign you up as a worker" do
    visit new_worker_path
    fill_in 'worker[email]', :with => 'email@worker.com'
    fill_in 'worker[password]', :with => 'password'
    fill_in 'worker[password_confirmation]', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Worker Dashboard'
  end
  it "will redirect you if you are already a worker" do
    worker = FactoryGirl.create(:worker)
    login_as(worker, scope: :worker)
    visit new_worker_path
    expect(page).to have_content "You're already logged"
  end
end
