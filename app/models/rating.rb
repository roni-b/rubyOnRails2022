class Rating < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }
  include RatingAverage
  scope :recent, -> { Rating.last(5) }
  def average
    ratings.map(:score).sum / ratings.count.to_f
  end
end
