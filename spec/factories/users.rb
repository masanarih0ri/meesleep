# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'testuser1@example.com' }
    password { 'testuser1' }
    name { 'testuser1' }

    after(:create, &:confirm)
  end
end
