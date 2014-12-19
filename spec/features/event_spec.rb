require "rails_helper"

feature "Events management" do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	scenario "It adds a new event to the journal" do
		event = FactoryGirl(:event)

		visit root_path

		click_link "Novo Evento"

	end

end