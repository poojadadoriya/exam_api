require 'rails_helper'

RSpec.describe "HelpSupports", type: :request do
  describe "POST /help_supports" do
    it "it should be create help and support" do
      post :'/help_support/create'
      expect(response).to have_http_status(200)
    end
  end
end