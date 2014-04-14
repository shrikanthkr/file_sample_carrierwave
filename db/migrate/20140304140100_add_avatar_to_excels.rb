class AddAvatarToExcels < ActiveRecord::Migration
  def change
    add_column :excels, :avatar, :string
  end
end
