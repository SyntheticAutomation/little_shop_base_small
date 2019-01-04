require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :rating }
    it { should validate_numericality_of(:rating).only_integer }
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(1) }
  end

  describe 'relationships' do
    it { should belong_to :item }
    it { should belong_to :user }
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
