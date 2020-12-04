# frozen_string_literal: true

module Api
  module V1
    class LeadsController < ActionController::Base
      skip_before_action :verify_authenticity_token
      before_action :set_lead, only: %i[destroy show update]
      # before_action :check_authorization, only: %i[destroy update]
      def index
        @leads = Lead.all
        render json: @leads
      end

      def show
        render json: @lead
      end

      def create
        @lead = Lead.new(lead_params)
        if @lead.save
          render json: @lead
        else
          render json: @lead.errors.full_messages.to_sentence
        end
      end

      def update
        if @lead.update(lead_params)
          render json: @lead
        else
          render json: @lead.errors.full_messages.to_sentence
        end
      end

      def destroy
        if @lead.destroy
          render json: { success: 'lead delete successfully' }
        else
          render json: { error: 'lead not delete successfully' }
        end
      end

      private

      def lead_params
        params.require(:lead).permit(:name, :client_name, :client_address, :client_email, :client_contact, :leadType, :user_id)
      end

      def set_lead
        @lead = Lead.find_by(id: params[:id])
      end

      def check_authorization
        authorize @lead
      end
    end
  end
end
