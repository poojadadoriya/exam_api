require 'rails_helper'

RSpec.describe Technology, type: :model do
  context "association" do
      it "it should be has many association" do
        t = Technology.reflect_on_association(:questions)
         expect(t.macro).to eq(:has_many)
       end
     end
end
