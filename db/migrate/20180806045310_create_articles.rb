class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :user_id, nul: false
      t.string :title, nul: false
      t.text :content, nul: false

      t.timestamps
    end
    add_index :articles, :user_id
  end
end
