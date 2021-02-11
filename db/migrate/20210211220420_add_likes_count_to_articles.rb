class AddLikesCountToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :likes_count, :bigint, default: 0
  end
end
