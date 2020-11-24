# frozen_string_literal: true

require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  test "should not save lead with out title" do
    lead = Lead.new
    assert_not lead.save,'save the article with out a name'
  end
end
