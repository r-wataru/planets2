# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  address    :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_emails_on_address  (address) UNIQUE
#

require 'rails_helper'

RSpec.describe Emails, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
