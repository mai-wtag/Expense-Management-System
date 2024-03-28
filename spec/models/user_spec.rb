require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
    end

    it 'validates maximum length of name' do
      user = User.new(name: 'a' * 31)
      expect(user).not_to be_valid
    end

    it 'validates presence of email' do
      user = User.new(email: nil)
      expect(user).not_to be_valid
    end

    it 'validates maximum length of email' do
      user = User.new(email: 'a' * 51)
      expect(user).not_to be_valid
    end

    it 'validates uniqueness of email' do
      existing_user = create(:user)
      user = User.new(email: existing_user.email)
      expect(user).not_to be_valid
    end

    it 'validates format of email' do
      user = User.new(email: 'test@example')
      expect(user).not_to be_valid
    end
  end
end
