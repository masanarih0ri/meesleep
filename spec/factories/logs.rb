# frozen_string_literal: true

FactoryBot.define do
  factory :log do
    user
    score { 40 }
    registered_on { DateTime.now }
  end
end