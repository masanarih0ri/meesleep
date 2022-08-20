# frozen_string_literal: true

FactoryBot.define do
  factory :log do
    user
    score { 50 }
    registered_on { DateTime.now }

    before(:create) { Log.skip_callback(:create, :before, :fill_score) }
    after(:create) { Log.set_callback(:create, :before, :fill_score) }
  end
end
