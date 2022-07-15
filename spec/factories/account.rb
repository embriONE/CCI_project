FactoryBot.define do
  factory :account do
    email {FFaker::Internet.email}
    username {FFaker::Name.name}
    password {"password"}
    password_confirmation {"password"}
  end
end