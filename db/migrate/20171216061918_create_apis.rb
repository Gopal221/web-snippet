class CreateApis < ActiveRecord::Migration[5.1]
  def change
    create_table :apis do |t|
    	  t.string :access_token
      t.string :user_id

      t.timestamps
    end
  end
end
