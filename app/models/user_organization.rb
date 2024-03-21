class UserOrganization < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :organization

  # Validations
  validates :invitation, presence: true, inclusion: { in: %w[pending accepted rejected] }

  # Callback to delete records with 'rejected' invitation
  after_save :delete_if_rejected

  private

  def delete_if_rejected
    self.destroy if self.invitation == 'rejected'
  end
end