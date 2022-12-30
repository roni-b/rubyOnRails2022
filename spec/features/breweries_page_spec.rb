require 'rails_helper'

describe "Breweries page" do
  it "should not have any before been created" do
    visit breweries_path
    expect(page).to have_content 'Breweries'
    expect(page).to have_content 'Number of active breweries: 0'
    expect(page).to have_content 'Number of retired breweries: 0'
  end
end
