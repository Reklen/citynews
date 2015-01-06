require 'rails_helper'

feature "Job management" do

	scenario 'display all jobs' do
	  visit root_path

	  first(".nav-main").click_link("Empregos")

	  expect(page).to have_content "Empregos da Semana"
	end
end