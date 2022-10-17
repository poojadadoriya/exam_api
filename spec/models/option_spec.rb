require 'rails_helper'

RSpec.describe Option, type: :model do
  context "association" do
      it "it should be  belongs to association" do
        t = Option.reflect_on_association(:question)
         expect(t.macro).to eq(:belongs_to)
       end
       it "it should be has one association" do
        t = Option.reflect_on_association(:answer)
         expect(t.macro).to eq(:has_one)
       end
     end
end
