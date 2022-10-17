require 'rails_helper'
  RSpec.describe User, type: :model do
    context "association" do
      it "it should be has many association" do
        t = User.reflect_on_association(:help_supports)
         expect(t.macro).to eq(:has_many)
       end
     end

    context "association" do
      it "it should be belongs to association" do
        t = User.reflect_on_association(:company)
      end
    end

    context "validation" do
      it "it should be present & unique" do
        expect(:email)
      end
    end

    context "validation" do
      it "it should be present" do
        expect(:username)
      end
    end
end