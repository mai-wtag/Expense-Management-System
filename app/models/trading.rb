class Trading < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :organization

  # Validations
  validates :amount, presence: true
end
