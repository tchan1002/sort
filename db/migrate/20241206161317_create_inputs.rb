class CreateInputs < ActiveRecord::Migration[7.1]
  def change
    create_table :inputs do |t|
      t.integer :user_id
      t.text :body
      t.string :status
      t.string :subject
      t.integer :attempts_count

      t.timestamps
    end
  end
end
