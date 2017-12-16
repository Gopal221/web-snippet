class CreateSnippets < ActiveRecord::Migration[5.1]
  def change
    create_table :snippets do |t|
    	t.references :user
      t.string :name
      t.string :content



      t.timestamps
    end
  end
end
