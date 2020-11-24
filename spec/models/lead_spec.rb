require 'rails_helper'

RSpec.describe Lead, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  subject { FactoryGirl.create(:lead, user_id: 1) } 
  describe '#Project' do
    describe "Associations" do
      it 'have many phases' do
        expect(subject).to have_many(:phases)
      end
      it 'have many comments' do
        expect(subject).to have_many(:comments)
      end
      it 'have one project' do
        expect(subject).to have_one(:project)
      end
    end
    
    describe 'Validations' do
      it 'is valid with valid attributes' do
        expect(subject).to be_valid
      end
      it 'is not valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end
      it 'is not valid without a client_name' do
        subject.client_name = nil
        expect(subject).to_not be_valid
      end
      it 'is not valid without a client_email' do
        subject.client_email = nil
        expect(subject).to_not be_valid
      end
      it 'is not valid without a client_address' do
        subject.client_address = nil
        expect(subject).to_not be_valid
      end
      it 'is not valid without a client_contact' do
        subject.client_contact = nil
        expect(subject).to_not be_valid
      end
      it 'is not valid without a lead type' do
        subject.leadType = nil
        expect(subject).to_not be_valid
      end
    end
  end
end
