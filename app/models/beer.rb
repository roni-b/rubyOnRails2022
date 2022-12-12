class Beer < ApplicationRecord
  include RatingAverage
  validates :name, presence: true
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { distinct }, through: :ratings, source: :user
  def average
    @ratings
  end

  def to_s
    "#{name} #{brewery.name}"
  end
end
