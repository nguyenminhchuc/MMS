class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.string :name_leader_team
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
