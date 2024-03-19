class Organization < ApplicationRecord
  # Associations
  has_many :tradings
  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
end
