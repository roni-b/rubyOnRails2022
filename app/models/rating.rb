class Rating < ApplicationRecord
    def to_s
        "#{name}"
    end
end
