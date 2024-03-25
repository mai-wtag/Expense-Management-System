require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'validates presence of body' do
      comment = Comment.new
      expect(comment).not_to be_valid
    end

    it 'validates length of body' do
      comment = Comment.new(body: 'a' * 101)
      expect(comment).not_to be_valid
    end
  end
end