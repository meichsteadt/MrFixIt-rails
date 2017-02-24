require 'rails_helper'

describe "workers pages" do
  it "take you to the worker page" do
    worker = FactoryGirl.create(:worker)
    login_as(worker, scope: :worker)
    visit worker_path(worker)
    expect(page).to have_content 'Log Out'
  end
end
