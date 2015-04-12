FactoryGirl.define do
  factory :player do
    name 'Player'
    position 'CAM'
    dob(Date.today - 25.years)
    goals 1
    assists 8
    red_cards 0
    yellow_cards 2
  end
end
