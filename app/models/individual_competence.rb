# == Schema Information
#
# Table name: individual_competences
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  pitcher         :boolean          default(FALSE), not null
#  catcher         :boolean          default(FALSE), not null
#  first           :boolean          default(FALSE), not null
#  second          :boolean          default(FALSE), not null
#  short           :boolean          default(FALSE), not null
#  third           :boolean          default(FALSE), not null
#  outfield        :boolean          default(FALSE), not null
#  line            :integer          default(0), not null
#  meet            :integer          default(0), not null
#  power           :integer          default(0), not null
#  running_ability :integer          default(0), not null
#  shoulder_power  :integer          default(0), not null
#  defense         :integer          default(0), not null
#  speed           :integer          default(0), not null
#  controll        :integer          default(0), not null
#  stamina         :integer          default(0), not null
#  throw           :integer          default(0), not null
#  swing           :integer          default(0), not null
#  deleted_at      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_individual_competences_on_user_id  (user_id)
#

require 'csv'
require "kconv"
require 'nkf'
class IndividualCompetence < ActiveRecord::Base
  belongs_to :user

  class << self
    def import_csv
      path = Rails.root.join("db", "seeds", "data", "mla_export_p_memdtl.csv")
      if File.exists?(path)
        file = path.read
        data = NKF::nkf('-w', file)
        csv = CSV.new(data)
        csv.each_with_index do |arr, idx|
          data_arr = arr[0].split(";")
          if User.exists?(id: data_arr[0])
            user = User.find(data_arr[0])
            self.create(
              user_id: user.id,
              pitcher: data_arr[1],
              catcher: data_arr[2],
              first: data_arr[3],
              second: data_arr[4],
              short: data_arr[5],
              third: data_arr[6],
              outfield: data_arr[7],
              line: data_arr[8],
              meet: data_arr[9],
              power: data_arr[10],
              running_ability: data_arr[11],
              shoulder_power: data_arr[12],
              defense: data_arr[13],
              speed: data_arr[14],
              controll: data_arr[15],
              stamina: data_arr[16],
              throw: data_arr[18],
              swing: data_arr[19])
          else
            return false
          end
        end
      end
    end
  end
end