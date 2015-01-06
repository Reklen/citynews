require 'rails_helper'

feature "Job management" do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	scenario 'display all jobs' do
	  visit root_path
	  first(".nav-main").click_link("Empregos")

	  expect(page).to have_content "Empregos da Semana"
	end

	scenario 'display a new job form' do
		visit root_path
		first(".nav-user").click_link("Empregos")
		expect(page).to have_content "Compartilhe uma vaga de emprego"
	end

	scenario 'create a new job' do
		job = FactoryGirl.build(:job)

		visit new_job_path(job)
		fill_in "job_title", with: job.title
		fill_in "job_description", with: job.description
		fill_in "job_salary", with: job.salary

		click_button "Enviar"

		expect(page).to have_content job.title
	end
end