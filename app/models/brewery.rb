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
  validates :name, presence: true
  validates :year, numericality: { only_integer: true,
                                   greater_than: 1039,
                                   less_than_or_equal_to: ->(_) { Time.now.year } }

  def average
    @ratings
  end
end
