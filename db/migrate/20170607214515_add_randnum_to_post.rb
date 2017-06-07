class AddRandnumToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :randnum, :integer
  end
end
