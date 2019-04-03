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
    it {should validate_numericality_of :role}
    it {should validate_length_of(:name).is_at_least(5).is_at_most(30)}
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      format_emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      format_emails.each do |format_email|
        @user.email = formats_email
        expect(@user).to be_valid
      end
    end
  end
end
