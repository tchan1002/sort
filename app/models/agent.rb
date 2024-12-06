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
end
