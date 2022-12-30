class Brewery < ApplicationRecord
  include RatingAverage

  validates :name, presence: true
  validates :year, numericality: { only_integer: true,
                                   greater_than: 1039,
                                   less_than_or_equal_to: ->(_) { Time.now.year } }

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  scope :active, -> { where active: true }
  scope :retired, -> { where active: [nil, false] }

  include RatingAverage
  def self.top(n)
    sorted_by_rating_in_desc_order = Brewery.all.sort_by { |b| -(b.average_rating || 0) }
    sorted_by_rating_in_desc_order[0, n]
  end
end
