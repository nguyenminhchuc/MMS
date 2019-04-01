require 'rails_helper'

RSpec.describe Relationship_skill, type: :model do
  describe 'associations' do
    it { should belong_to :skill }
    it { should belong_to :user }
  end
end

