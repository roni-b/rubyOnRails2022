require 'rails_helper'

include Helpers

describe "Beers" do
  before :each do
    FactoryBot.create(:brewery, name: "Schlenkerla", year: 1678)
    FactoryBot.create :user
    FactoryBot.create :style
    sign_in(username: "Pekka", password: "Foobar1")
  end

  it "can be created with valid input" do
    visit new_beer_path
    fill_in('beer[name]', with: 'Helles')
    select('Schlenkerla', from: 'beer[brewery_id]')

    expect do
      click_button('Create Beer')
    end.to change { Beer.count }.by(1)
  end

  it "can not be created with without a name" do
    visit new_beer_path
    select('Schlenkerla', from: 'beer[brewery_id]')

    expect do
      click_button('Create Beer')
    end.to change { Beer.count }.by(0)

    expect(page).to have_content "Name can't be blank"
  end
end

# rspec spec/features/beers_page_spec.rb

# save_and_open_page
