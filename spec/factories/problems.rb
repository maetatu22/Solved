FactoryBot.define do
  factory :problem do
    title               {"aaaaa"}
    text                {"12345678901234567"}
    genre_id            {3}
    association :user
  end
end
