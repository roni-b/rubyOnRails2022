class Membership < ApplicationRecord
  belongs_to :beer_club
  belongs_to :user
  validates :user, uniqueness: true
end
