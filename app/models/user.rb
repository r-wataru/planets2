# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  number          :integer
#  login_name      :string(255)
#  password_digest :string(255)
#  display_name    :string(255)
#  birthday        :date
#  age             :integer
#  logged_at       :datetime
#  description     :text
#  created         :boolean          default(FALSE), not null
#  checked         :boolean          default(FALSE), not null
#  deleted_at      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_users_on_number  (number) UNIQUE
#

require 'csv'
require "kconv"
require 'nkf'
class User < ActiveRecord::Base
  include MiniAuth

  has_many :pitcher_results
  has_many :pitcher_total_results
  has_many :individual_results
  has_many :individual_total_results
  
  attr_reader :new_email
  attr_accessor :select_user_name, :new_user_name

  before_save do
    unless self.birthday.nil?
      self.age = age_calculation
    end
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
#;投;捕;一;二;遊;三;外;弾丸;ミート;パワー;走力;肩力;守力;球速;コントロール;スタミナ;守備内容;投げ方;打ち方
