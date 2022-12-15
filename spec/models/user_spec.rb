require 'rails_helper'

include Helpers

RSpec.describe User, type: :model do
  describe "favorite beer" do
    let(:user) { FactoryBot.create(:user) }

    it "has method for determining the favorite beer" do
      expect(user).to respond_to(:favorite_beer)
    end

    it "without ratings does not have a favorite beer" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = FactoryBot.create(:beer)
      rating = FactoryBot.create(:rating, score: 20, beer:, user:)

      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with highest rating if several rated" do
      create_beers_with_many_ratings({ user: }, 10, 20, 15, 7, 9)
      best = create_beer_with_rating({ user: }, 25)

      expect(user.favorite_beer).to eq(best)
    end
  end
  describe "favorite style" do
    let(:user) { FactoryBot.create(:user) }

    it "has method for determining the favorite style" do
      expect(user).to respond_to(:favorite_style)
    end
    it "without ratings does not have a favorite style" do
      expect(user.favorite_beer).to eq(nil)
    end
    it "favorite style when only one rating" do
      one = create_beer_with_rating({ user: }, 25)
      expect(user.favorite_style).to eq(one.style)
    end
  end
end

def create_beer_with_rating(object, score)
  beer = FactoryBot.create(:beer)
  FactoryBot.create(:rating, beer:, score:, user: object[:user])
  beer
end

def create_beers_with_many_ratings(object, *scores)
  scores.each do |score|
    create_beer_with_rating(object, score)
  end
end
