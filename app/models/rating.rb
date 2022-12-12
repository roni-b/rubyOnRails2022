class Rating < ApplicationRecord
  def to_s
    name.to_s
  end
end
