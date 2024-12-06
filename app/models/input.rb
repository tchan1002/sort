# == Schema Information
#
# Table name: inputs
#
#  id             :bigint           not null, primary key
#  attempts_count :integer
#  body           :text
#  status         :string
#  subject        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Input < ApplicationRecord
belongs_to(:user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true)
has_many(:attempts, class_name: "Attempt", foreign_key: "input_id", dependent: :destroy)
end
