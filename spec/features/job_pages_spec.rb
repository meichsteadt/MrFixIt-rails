require 'rails_helper'

describe "workers pages" do
  it "shows you the jobs" do
    visit jobs_path
    expect(page).to have_content 'Jobs'
  end
  it "shows you a jobs and adds it to a worker", js: true do
    worker = FactoryGirl.create(:worker)
    login_as(worker, scope: :worker)
    job = FactoryGirl.create(:job)
    visit job_path(job)
    click_link 'click here to claim it now'
    expect(page).to have_content 'View your jobs'
  end
end
