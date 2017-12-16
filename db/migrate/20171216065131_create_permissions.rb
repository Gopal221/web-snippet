class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
    	t.references :user
    	t.references :snippet
      t.timestamps
    end
  end
end
