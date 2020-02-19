FactoryBot.define do
factory :note,  class: 'Note' do
    title { Faker::Lorem.sentence[0..29] }
    body { Faker::Lorem.sentence[0..999] }
  end
end
