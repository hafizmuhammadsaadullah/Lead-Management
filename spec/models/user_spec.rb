require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#User' do
    let(:user) { FactoryGirl.create(:user) }
    describe "Associations" do
      it { should have_one_attached(:image) }
      it { should have_many(:leads).dependent(:destroy) }
      it { should have_many(:phase_users).dependent(:destroy) }
      it { should have_many(:requests).dependent(:destroy) }
      it { should have_many(:comments).dependent(:destroy) }
      it { should have_many(:projects).dependent(:destroy) }
      it { should have_many(:phases).dependent(:destroy) }
    end

    describe 'Validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:user_name) }
    end
    describe 'is admin' do
      let(:user) { FactoryGirl.create(:admin) }

      it do
        byebug
        expect(user.admin?).to eql(true) 
      end
      let(:user) { FactoryGirl.create(:manager) }
      it { expect(user.admin?).to eql(false) }
    end
    describe 'is developer' do
      let(:user) { FactoryGirl.create(:business_developer) }
      it { expect(user.developer?).to eql(true) }
      let(:user) { FactoryGirl.create(:manager) }
      it { expect(user.developer?).to eql(false) }
    end
    describe 'is manager' do
      let(:user) { FactoryGirl.create(:manager) }
      it { expect(user.manager?).to eql(true) }
      let(:user) { FactoryGirl.create(:admin) }
      it { expect(user.manager?).to eql(false) }
    end
    describe 'is Engineer' do
      let(:user) { FactoryGirl.create(:engineer) }
      it { expect(user.engineer?).to eql(true) }
      let(:user) { FactoryGirl.create(:admin) }
      it { expect(user.engineer?).to eql(false) }
    end
  end
end
