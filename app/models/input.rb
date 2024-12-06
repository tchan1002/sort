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
end
