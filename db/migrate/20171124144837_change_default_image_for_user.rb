class ChangeDefaultImageForUser < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :photo, "avatar.svg")
  end
end
