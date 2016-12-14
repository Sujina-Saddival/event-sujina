class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event
      t.string :venue
      t.string :date
      t.string :time
      t.string :description
      t.string :invited
      t.integer :user_id
      t.string :invitee, array: true, default: []
      t.string :status;
      t.timestamps null: false
    end
  end
end
