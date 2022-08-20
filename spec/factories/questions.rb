# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    content { '質問1' }
    is_active { true }
  end
end
