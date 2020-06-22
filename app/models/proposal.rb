class Proposal < ApplicationRecord
  belongs_to :challenge
  belongs_to :startup
  has_one_attached :photo
end
