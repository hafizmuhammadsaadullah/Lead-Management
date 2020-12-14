# frozen_string_literal: true

class LeadSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :client_name, :client_email, :client_contact, :client_address, :transition_date,
             :leadType, :is_sale, :created_at, :updated_at
end
cd ../