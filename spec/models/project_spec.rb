require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#Project' do
    let(:user) { FactoryGirl.create(:user) }
    let(:lead) { FactoryGirl.create(:lead, user_id: user.id) }
    subject { FactoryGirl.create(:project, user_id: user.id, lead_id: lead.id) }

    describe "Associations" do
      it 'belongs to lead' do
        expect(subject).to belong_to(:lead)
      end
      it 'belong to user' do
        expect(subject).to belong_to(:user)
      end
    end
    describe "Validations" do
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
      it 'is not valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end
      it 'is not valid without a lead_id' do
        subject.lead_id = nil
        expect(subject).to_not be_valid
      end
      it 'is not valid without a user_id' do
        subject.user_id = nil
        expect(subject).to_not be_valid
      end
    end
  end
end
