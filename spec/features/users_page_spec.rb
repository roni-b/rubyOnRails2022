require 'rails_helper'

include Helpers

describe "User" do
  before :each do
    FactoryBot.create :user
  end
end
describe "Ratings page" do
  let!(:brewery) { FactoryBot.create :brewery, name: "Koff" }

  it "ratings exists" do
    visit ratings_path
    expect(page).to have_content 'Top breweries'
    expect(page).to have_content 'Recent ratings'
  end
end
