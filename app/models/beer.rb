class Beer < ApplicationRecord
    include RatingAverage
    belongs_to :brewery
    has_many :ratings, dependent: :destroy
    def average
        #ratings.map(&:score).sum / ratings.count.to_f
        @ratings
    end

    def to_s 
        self.name
    end
end
