class RemoveCommenterFromComments < ActiveRecord::Migration[6.1]
  def up
    remove_column :comments, :commenter
  end
end
