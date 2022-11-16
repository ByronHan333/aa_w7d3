# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.user_name }
    # username { "lilly_llama" }
    password { "password" }
  end
end
