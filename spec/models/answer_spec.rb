require 'rails_helper'

RSpec.describe Answer, type: :model do
  context "association" do
      it "it should be has belongs to association" do
        t = Answer.reflect_on_association(:question)
         expect(t.macro).to eq(:belongs_to)
       end
      it "it should be has belongs to association" do
        t = Answer.reflect_on_association(:option)
         expect(t.macro).to eq(:belongs_to)
       end
     end
end