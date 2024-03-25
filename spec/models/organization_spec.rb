require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it 'has many tradings' do
      association = described_class.reflect_on_association(:tradings)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      organization = Organization.new
      expect(organization).not_to be_valid
    end

    it 'validates uniqueness of name' do
      Organization.create(name: 'Test Organization')
      organization = Organization.new(name: 'Test Organization')
      expect(organization).not_to be_valid
    end

    it 'validates length of name' do
      organization = Organization.new(name: 'a' * 31)
      expect(organization).not_to be_valid
    end
  end
end