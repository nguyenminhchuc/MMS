class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :level
      t.integer :used_year_member

      t.timestamps
    end
  end
end
