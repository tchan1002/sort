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
belongs_to(:input, required: true, class_name: "Input", foreign_key: "input_id", counter_cache: true)
belongs_to(:agent, required: true, class_name: "Agent", foreign_key: "agent_id", counter_cache: true)
end
