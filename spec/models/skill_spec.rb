require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'associations' do
    it { should have_many :relationship_skills }
    it { should have_many :users.through(:relationship_skills) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :level}
    it {should validate_presence_of :used_year_member}
    it {should validate_numericality_of :used_year_member}
  end
end
