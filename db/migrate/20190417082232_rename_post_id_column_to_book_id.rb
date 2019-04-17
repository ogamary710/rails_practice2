class RenamePostIdColumnToBookId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :post_comments, :post_id, :book_id
  end
end
