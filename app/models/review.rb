class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  REVIEW_PARAMS = %i(rating content).freeze
end
