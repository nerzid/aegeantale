class CreateGroupMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :group_maps do |t|
      t.integer :status
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
