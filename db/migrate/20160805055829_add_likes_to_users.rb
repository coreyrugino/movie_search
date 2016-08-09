class AddLikesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :likes, :text, default: [], array: true
  end
end
