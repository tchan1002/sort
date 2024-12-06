# == Schema Information
#
# Table name: attempts
#
#  id         :bigint           not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agent_id   :integer
#  input_id   :integer
#
class Attempt < ApplicationRecord
end
