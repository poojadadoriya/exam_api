require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do |example|
    @company = Company.create(company_name: "task", director_name: "sonu")
    @user = User.create(username: "sonu", email: "sonu.rathoer@tasmdkd.in", password: "sonu@123", company_id: @company.id)
  end
  describe "POST Create user" do
    it "create user" do
      
      post "/api/v1/users",  params: {
                                      "data": {
                                          "username": "sonu",
                                          "email": "sonu.rathor@gmail.com",
                                          "password": "Sonu@123",
                                          "company_id": @company.id,
                                        
                                        }
                                      }
        data = JSON.parse(response.body)
        expect(data["data"]["picture"]["record"]["username"]).to eq("sonu")
      expect(response).to have_http_status(200)
    end
  end

 
  describe "POST/users" do
    it "it should login" do
      post '/api/v1/auth/login', params: {"email": "sonu.rathoer@tasmdkd.in", "password": "sonu@123"}
      expect(response).to have_http_status(200)
    end
  end

  describe "put/users" do
    it "it will update user" do
     put "/api/v1/users/#{@user.id}",  params: {
                                            "last_name": "dadoriya"
                                            }
                                     
      data = JSON.parse(response.body)
      expect(data["data"]["picture"]["record"]["last_name"]).to eq("dadoriya")                                 
      expect(response).to have_http_status(200)
    end
  end


  describe "delete/users" do
    it "it will delete user" do
      delete "/api/v1/users/#{@user.id}"
      expect(response).to have_http_status(422)
    end
  end
  end