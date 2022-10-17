require 'rails_helper'

RSpec.describe Company, type: :model do
   context "association" do
      it "it should be has belongs to association" do
        t = Company.reflect_on_association(:users)
         expect(t.macro).to eq(:has_many)
       end
     end
end
