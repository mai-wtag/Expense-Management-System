class Comment < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :body, presence: true, length: { maximum: 100 }
end
