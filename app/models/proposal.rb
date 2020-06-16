class Proposal < ApplicationRecord
  belongs_to :challenge
  belongs_to :startup
end
