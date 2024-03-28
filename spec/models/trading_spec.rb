require 'rails_helper'

RSpec.describe Trading, type: :model do
  describe 'validations' do
    it 'validates presence of amount' do
      trading = Trading.new
      expect(trading).not_to be_valid
    end

    it 'validates numericality of amount' do
      trading = Trading.new(amount: 'abc')
      expect(trading).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to organization' do
      association = described_class.reflect_on_association(:organization)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
