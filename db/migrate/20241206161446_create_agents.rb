class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.integer :user_id
      t.string :name
      t.text :directive
      t.integer :attempts_count

      t.timestamps
    end
  end
end
