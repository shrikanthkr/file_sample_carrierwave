class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.float :empid
      t.string :name
      t.string :designation
      t.string :grade
      t.float :mobile
      t.string :tcsmailid
      t.string :nmailid
      t.string :seatno
      t.string :city
      t.string :country
      t.string :client
      t.string :stream
      t.string :portfolio
      t.float :won
      t.string :pname
      t.string :award
      t.string :awardname

      t.timestamps
    end
  end
end
