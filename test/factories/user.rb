FactoryGirl.define do
  factory :user do
    oauth_provider 'twitter'
    oauth_uid 'uuid'
    name 'Person Name'
    avatar_url 'http://localhost:3000/image.png'
  end
end
