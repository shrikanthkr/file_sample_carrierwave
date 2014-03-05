class AddColumnsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :pRAG, :string
    add_column :projects, :pPass, :string
    add_column :projects, :pFail, :string
    add_column :projects, :pNoRun, :string
    add_column :projects, :pNotComp, :string
    add_column :projects, :pTotalCase, :string
    add_column :projects, :pTower, :string
    add_column :projects, :pSpecType, :string
    add_column :projects, :pTargetDate, :string
  end
end
