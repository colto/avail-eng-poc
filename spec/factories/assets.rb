FactoryBot.define do
  factory :asset do
    active_at { DateTime.now - 5.days }
    inactive_at { [DateTime.now + 100.days, nil].sample }
  end
end
