# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    association :log
    association :question
    is_good_habit { true }
  end
end
