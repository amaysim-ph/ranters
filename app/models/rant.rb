class Rant < ApplicationRecord
  belongs_to :ranter

  scope :descending, -> { order("created_at DESC") }
end
