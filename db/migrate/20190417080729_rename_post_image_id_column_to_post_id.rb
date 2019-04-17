class RenamePostImageIdColumnToPostId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :post_comments, :post_image_id, :post_id
  end
end
