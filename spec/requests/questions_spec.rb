require 'rails_helper'

RSpec.describe "Questions", type: :request do
  describe "GET /questions" do
    it "should be show questions" do
      get :'/api/v1/question/id', :params => {:id => 1}
      expect(response).to have_http_status(200)
    end
  end
end