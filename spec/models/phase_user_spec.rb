require 'rails_helper'

RSpec.describe PhaseUser, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:lead) { FactoryGirl.create(:lead, user_id: user.id) }
  let(:phase) { FactoryGirl.create(:phase, user_id: user.id, lead_id: lead.id) }
  subject { FactoryGirl.create(:phase_user, user_id: user.id, phase_id: phase.id) }

  describe 'Associations' do
    it { should belong_to(:phase) }
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:phase_id) }
    it { should validate_presence_of(:description) }
  end
end
