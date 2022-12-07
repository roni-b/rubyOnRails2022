class Beer < ApplicationRecord
  belongs_to :brewery
  has_many :ratings
end

class Rating < ApplicationRecord
  belongs_to :beer
end

class Brewery < ApplicationRecord
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def average
    #return 0 if ratings.empty?
    #ratings.map(&:score).sum / ratings.count.to_f
    @ratings
  end

end

