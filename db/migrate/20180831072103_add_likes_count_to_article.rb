class AddLikesCountToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :likes_count, :integer
  end
end
