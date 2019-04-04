class AddTeamProjectToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :team, foreign_key: true
    add_reference :users, :project, foreign_key: true
  end
end
