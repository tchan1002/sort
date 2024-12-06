# == Schema Information
#
# Table name: agents
#
#  id             :bigint           not null, primary key
#  attempts_count :integer
#  directive      :text
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Agent < ApplicationRecord
belongs_to(:user, required: true, class_name: "User", foreign_key: "user_id")
has_many(:attempts, class_name: "Attempt", foreign_key: "agent_id", dependent: :destroy)
has_many(:inputs, through: :attempts, source: :input)
end
