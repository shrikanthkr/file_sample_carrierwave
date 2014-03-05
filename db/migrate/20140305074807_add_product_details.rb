class AddProductDetails < ActiveRecord::Migration
  def change
		add_column :projects, :name  , :string
  	  	add_column :projects, :number, :string
  	  	add_column :projects, :lead  , :string
  end
end
