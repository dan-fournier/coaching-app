FactoryBot.define do
  factory :assigned_session do
    date { Date.new(2024, 2, 3) }
    details { "60 minute easy run" }
    session_type { :easy_run }

    athlete { create(:athlete) }
  end
end
