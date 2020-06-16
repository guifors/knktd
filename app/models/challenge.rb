class Challenge < ApplicationRecord
  belongs_to :corporate
  belongs_to :user
  has_many :proposals
end
