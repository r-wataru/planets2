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

require 'csv'
require "kconv"
require 'nkf'

class User < ActiveRecord::Base
  has_many :pitcher_results
  has_many :individual_results
  
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
  
  class << self
    def import_csv
      path = Rails.root.join("db", "seeds", "data", "mla_export_p_pitcher.csv")
      if File.exists?(path)
        file = path.read
        data = NKF::nkf('-w', file)
        csv = CSV.new(data)
        csv.each_with_index do |arr, idx|
          # csvがない
        end
      else
        return false
      end
    end
  end
end
