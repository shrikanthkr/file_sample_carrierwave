class CreateExcels < ActiveRecord::Migration
  def change
    create_table :excels do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
