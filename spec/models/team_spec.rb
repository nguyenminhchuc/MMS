require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    it { should have_many :users }
    it { should belong_to :project }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :name_leader_team}
  end
end
