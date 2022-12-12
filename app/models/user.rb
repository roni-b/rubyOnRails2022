class User < ApplicationRecord
  include RatingAverage
  has_secure_password
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :password, length: { minimum: 4 }
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  def average
    @ratings
  end
end

class Rating < ApplicationRecord
  belongs_to :beer
  belongs_to :user
  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

  def to_s
    "#{beer.name} #{score}"
  end
end
