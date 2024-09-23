# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name)       { |n| "適当に作られたユーザー#{n}" }
    sequence(:email)      { |n| "test#{n}@example.com" }
    password              { "foobar" }
    password_confirmation { "foobar" }
  end
end
