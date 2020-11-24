require 'rails_helper'

RSpec.describe RequestsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:lead) { FactoryGirl.create(:lead, user_id: user.id) }
  let(:phase) { FactoryGirl.create(:phase, user_id: user.id, lead_id: lead.id) }
  before do
    sign_in user
  end
  describe "#new" do
    context "when the user is admin" do
      let(:user) { FactoryGirl.create(:admin)  }
      it "allow admin to create new request" do
        get :new, params: { phase_id: phase.id }
        expect(response).to be_success
      end
    end
    context "when the user is Bussiness Developer" do
      let(:user) { FactoryGirl.create(:business_developer)  }
      it "allow Bussiness Developer to create new request" do
        get :new, params: { phase_id: phase.id }
        expect(response).to be_success
      end
    end
    context "when the user is Manager" do
      let(:user) { FactoryGirl.create(:manager)  }
        it "do not allow Manager to create new request" do
          get :new, params: { phase_id: phase.id }
          expect(flash[:error]).to be_present
        end
      end
    context "when the user is Engineer" do
    let(:user) { FactoryGirl.create(:engineer)  }
      it "do not allow engineer to create new request" do
        get :new, params: { phase_id: phase.id }
        expect(flash[:error]).to be_present
      end
    end
  end

  describe "#create" do
    context "when the user is admin" do
      let(:user) { FactoryGirl.create(:admin)  }
      it "allow admin to create request" do
        request = attributes_for(:request,user_id: user.id)
        post :create, params: { phase_id: phase.id , request: request }
        expect(flash[:notice]).to eq('invitation send successfully')
      end
    end
    context "when the user is Bussiness Developer" do
      let(:user) { FactoryGirl.create(:business_developer)  }
      it "allow Bussiness Developer to create request" do
        request = attributes_for(:request,user_id: user.id)
        post :create, params: { phase_id: phase.id , request: request }
        expect(flash[:notice]).to eq('invitation send successfully')
      end
    end
    context "when the user is Manager" do
      let(:user) { FactoryGirl.create(:manager)  }
        it "do not allow Manager to create request" do
          request = attributes_for(:request,user_id: user.id)
          post :create, params: { phase_id: phase.id, request: request  }
          expect(flash[:error]).to be_present
        end
      end
    context "when the user is Engineer" do
    let(:user) { FactoryGirl.create(:engineer)  }
      it "do not allow engineer to create request" do
        request = attributes_for(:request,user_id: user.id)
        post :create, params: { phase_id: phase.id, request: request  }
        expect(flash[:error]).to be_present
      end
    end
  end

  describe "#destroy" do
    context "when the user is admin" do
      let(:user) { FactoryGirl.create(:admin) }
      let(:lead) { FactoryGirl.create(:lead, user_id: user.id) }
      let(:phase) { FactoryGirl.create(:phase, user_id: user.id, lead_id: lead.id) }
      let(:request) { FactoryGirl.create(:request, user_id: user.id, phase_id: phase.id) }
      it "allow admin to delete request" do
        delete :destroy, params: { phase_id: phase.id, id: request.id }
        expect(flash[:notice]).to eq('Manager request remove successfully')
      end
      # it "raise error while deleting request" do
      #   delete :destroy, params: { phase_id: phase.id, id: 333 }
      #   byebug
      #   expect(flash[:notice]).to eq('Manager request remove successfully')
      # end
    end
    context "when the user is Bussiness Developer" do
      let(:user) { FactoryGirl.create(:business_developer)  }
      let(:lead) { FactoryGirl.create(:lead, user_id: user.id) }
      let(:phase) { FactoryGirl.create(:phase, user_id: user.id, lead_id: lead.id) }
      let(:request) { FactoryGirl.create(:request, user_id: user.id, phase_id: phase.id) }
      it "allow Bussiness Developer to delete request" do
        delete :destroy, params: { phase_id: phase.id, id: request.id }
        expect(flash[:notice]).to eq('Manager request remove successfully')
      end
      # it "raise error while deleting request" do
      #   delete :destroy, params: { phase_id: phase.id, id: 333 }
      #   byebug
      #   expect(flash[:notice]).to eq('Manager request remove successfully')
      # end
    end
    context "when the user is Manager" do
      let(:user) { FactoryGirl.create(:manager)  }
      let(:lead) { FactoryGirl.create(:lead, user_id: user.id) }
      let(:phase) { FactoryGirl.create(:phase, user_id: user.id, lead_id: lead.id) }
      let(:request) { FactoryGirl.create(:request, user_id: user.id, phase_id: phase.id) }
      it "do not allow Manager to delete request" do
        delete :destroy, params: { phase_id: phase.id, id: request.id }
        expect(flash[:error]).to be_present
      end
    end
    context "when the user is Engineer" do
      let(:user) { FactoryGirl.create(:engineer)  }
      let(:lead) { FactoryGirl.create(:lead, user_id: user.id) }
      let(:phase) { FactoryGirl.create(:phase, user_id: user.id, lead_id: lead.id) }
      let(:request) { FactoryGirl.create(:request, user_id: user.id, phase_id: phase.id) }
      it "do not allow engineer to delete request" do
        delete :destroy, params: { phase_id: phase.id, id: request.id }
        expect(flash[:error]).to be_present
      end
    end
  end
end