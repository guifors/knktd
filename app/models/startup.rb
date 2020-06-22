class Startup < ApplicationRecord
  has_many :proposals
  has_many :challenges, through: :proposals
  has_one_attached :photo
end
