class RenameTumbnamilToArticles < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :thumbnamil, :thumbnail
  end
end
