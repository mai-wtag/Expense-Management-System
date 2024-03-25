FactoryBot.define do
  factory :user_organization do
    user
    organization
    invitation { %w[pending accepted rejected].sample }
  end
end