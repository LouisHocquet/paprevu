class Activity < ApplicationRecord
  has_one_attached :photo
  has_many :discoveries, dependent: :destroy
end
