require 'rails_helper'

include Helpers

describe "User" do
    let!(:user) { FactoryBot.create :user }
    before :each do
      visit signin_path
      fill_in('username', with: 'Pekka')
      fill_in('password', with: 'Foobar1')
      click_button('Log in')
    end

  describe "Beers page" do
    let!(:brewery) { FactoryBot.create :brewery, name: "Koff" }

    it "can add a beer" do
      visit new_beer_path
      expect(page).to have_content 'New beer'
      fill_in('beer_name', with: 'testi')
      expect do
        click_button('Create Beer')
      end.to change { Beer.count }.by(1)
    end

    it "does not add when invalid name" do
      visit new_beer_path
      expect do
        click_button('Create Beer')
      end.to change { Beer.count }.by(0)
    end
  end
end
