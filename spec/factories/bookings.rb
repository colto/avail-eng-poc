FactoryBot.define do
  factory :booking do
    start_at { DateTime.now }
    end_at { DateTime.now + 5.days }
  end
end
