FactoryBot.define do
  factory :note,  class: 'Note' do
    title { Faker::Lorem.sentence[0..29] }
    body { Faker::Lorem.sentence[0..999] }
    user { User.first }
  end

  factory :user, class: 'User' do
    # sequence(:code) { |n| "#{Faker::Company.name} #{n}"}
    code {Faker::Name.unique.name}
    email {Faker::Internet.email}
    role {"Admin"}
  end

end
