# frozen_string_literal: true

FactoryBot.define do
  factory :user do
  	id { |n| n }
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 20) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
