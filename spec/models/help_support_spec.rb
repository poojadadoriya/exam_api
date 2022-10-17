require 'rails_helper'

RSpec.describe HelpSupport, type: :model do
  context "association" do
      it "it should be has belongs to association" do
        t = HelpSupport.reflect_on_association(:user)
         expect(t.macro).to eq(:belongs_to)
       end
     end
end
