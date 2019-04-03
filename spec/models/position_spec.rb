require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'associations' do
    it { should have_many :users }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :short_name}
    it {should validate_length_of(:name).is_at_least(5).is_at_most(30)}
    it {should validate_length_of(:short_name).is_at_least(5).is_at_most(20)}
  end
end
