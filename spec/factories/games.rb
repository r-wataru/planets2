# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  season_id  :integer          not null
#  name       :string(255)      not null
#  result1    :text
#  result2    :text
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
  end
end
