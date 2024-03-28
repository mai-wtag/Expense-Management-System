class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  validates :invitation, presence: true, inclusion: { in: %w[pending accepted rejected] }
  after_save :delete_if_rejected

  private

  def delete_if_rejected
    destroy if invitation == 'rejected'
  end
end
