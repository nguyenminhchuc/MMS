require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should have_many :teams }
    it { should have_many :users }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :short_name}
    it {should validate_presence_of :status}
    it {should validate_presence_of :start_date}
    it {should validate_presence_of :end_date}
  end

end

