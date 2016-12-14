class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :phone
      t.string :docter

      t.timestamps null: false
    end
  end
end
