require 'rails_helper'

RSpec.describe Beer, type: :model do
  let(:style) { FactoryBot.create(:style) }
  let(:beer) { FactoryBot.create(:beer) }

  it "is saved when name, style and brewery set" do
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end
end
