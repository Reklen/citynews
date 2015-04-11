require "rails_helper"

feature "Events management" do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  scenario "creates a new event" do
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

  scenario "displays all current events" do
    visit root_path
    first(".nav-main").click_link("Eventos")

    expect(page).to have_content("Eventos")
  end

  scenario "updates an event" do
    location = FactoryGirl.build(:location)
    event = user.events.create(title: "test", description: "test", date: Time.now, location: location)
    visit event_path(event)

    click_link "Editar"

    fill_in "event_title", with: "New title"

    click_button "Enviar"

    expect(page).to have_content("Evento alterado")
  end

  scenario "delete an event" do
    location = FactoryGirl.build(:location)
    event = user.events.create(title: "test", description: "test", date: Time.now, location: location)
    visit event_path(event)

    click_link "Deletar"

    expect(page).to have_content("Evento deletado")
  end
end
