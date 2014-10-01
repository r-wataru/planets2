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

class IndividualCompetence < ActiveRecord::Base
end