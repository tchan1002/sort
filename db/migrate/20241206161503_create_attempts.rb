class CreateAttempts < ActiveRecord::Migration[7.1]
  def change
    create_table :attempts do |t|
      t.integer :input_id
      t.integer :agent_id
      t.string :status

      t.timestamps
    end
  end
end
