require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'associations' do
    it { should have_many :users }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :short_name}
    it {should validate_presence_of :status}
  end

end

