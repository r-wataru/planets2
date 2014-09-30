# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  number       :integer
#  display_name :string(255)
#  screen_name  :string(255)
#  birthday     :date
#  age          :integer
#  logged_at    :datetime
#  description  :text
#  deleted_at   :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
