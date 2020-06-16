class Startup < ApplicationRecord
  has_many :proposals
  has_many :challenges, through: :proposals
end
