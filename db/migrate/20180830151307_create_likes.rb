class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :article_id, nul: false
      t.integer :guest_id, nul: false

      t.timestamps
    end
    add_index :likes, [:article_id, :guest_id], unique: true
  end
end
