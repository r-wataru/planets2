# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  number       :integer
#  display_name :string(255)
#  birthday     :date
#  age          :integer
#  logged_at    :datetime
#  description  :text
#  deleted_at   :datetime
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_users_on_number  (number) UNIQUE
#

class User < ActiveRecord::Base
  before_save do
    self.age = age_calculation
  end

  def age_calculation
    d1 = self.birthday.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end

  def display_age
    if self.age.present?
      return "#{age}歳"
    end
  end
end
