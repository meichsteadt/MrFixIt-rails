require 'rails_helper'

describe "landing page process" do
  it "take you to the landing page" do
    visit root_path
    expect(page).to have_content 'Mr. Fix-It'
  end
end
