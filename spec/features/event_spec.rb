require "rails_helper"

feature "Events management" do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	scenario "It visits the event create page" do
		visit root_path

		first(".nav-user").click_link("Eventos")

		expect(page).to have_content("Compartilhe um evento")
	end

	scenario "It creates a new event" do
		event = FactoryGirl.create(:event)

		visit new_event_path
		fill_in "event_title", with: event.title
		fill_in "event_description", with: event.description
		select '11', :from => 'event_date_3i'
		select 'January', :from => 'event_date_2i'
		select '2015', :from => 'event_date_1i'

		click_button "Enviar"

		expect(page).to have_content event.title
	end

end