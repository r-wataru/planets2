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

  has_one :individual_competence
  has_many :emails
  has_many :pitcher_results
  has_many :pitcher_total_results
  has_many :individual_results
  has_many :individual_total_results

  attr_reader :new_email
  attr_accessor :select_user_name, :new_user_name

  validate :check_select_user_name
  validate :check_login_name
  validate :check_display_name
  validate :check_password

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

  def email=(address)
    self.emails.build(address: address)
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

  private
  def check_select_user_name
    if new_user_name == "0"
      if select_user_name.blank?
        errors.add(:select_user_name, :blank)
      end
    end
  end

  def check_login_name
    if new_user_name == "1" || new_user_name == true
      if login_name.blank?
        errors.add(:login_name, :blank)
      else
        if login_name !~ /\A[a-z0-9_+-]+\z/
          errors.add(:login_name, :invalid)
        elsif User.all.exists?(login_name: login_name)
          errors.add(:login_anme, :already)
        end
      end
    end
  end

  def check_display_name
    if new_user_name == "1" || new_user_name == true
       if display_name.blank?
        errors.add(:display_name, :blank)
      end
    end
  end

  def check_password
    if new_user_name == "1" || new_user_name == true
      if password.blank?
        errors.add(:password, :blank)
      end
    end
  end
end
