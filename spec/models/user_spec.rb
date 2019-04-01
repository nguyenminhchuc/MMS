require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should belong_to :position }
    it { should belong_to :team }
    it { should belong_to :project }
    it { should have_many :relationship_skills }
    it { should have_many :skills.through(:relationship_skills) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :birthday}
    it {should validate_presence_of :email}
    it {should validate_presence_of :role}
    it {should validate_presence_of :status}
    it {should validate_numericality_of :role}
  end
end