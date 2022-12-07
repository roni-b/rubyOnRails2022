module RatingAverage
 extend ActiveSupport::Concern
 
 def average_rating
   ratings.map(&:score).sum / ratings.count.to_f
   ratings.average(:score)
 end
end
