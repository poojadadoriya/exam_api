FactoryBot.define do
    factory :user do
      name { 'pooja' }
      username  { 'pooja' }
      email { pooja.dadoriya@taskcraft.in }
      password { pooja123 }
      id {1}
      company_id { '1' }
    end
  end 