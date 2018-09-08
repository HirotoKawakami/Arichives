class RenameImageColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :image, :thumbnamil
  end
end
