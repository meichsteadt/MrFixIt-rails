require 'rails_helper'

describe "workers pages" do
  it "take you to the worker page" do
    visit root_path
    expect(page).to have_content 'Mr. Fix-It'
  end
end
