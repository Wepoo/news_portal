class AddUserContacts < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :last_name
      t.date :birthday
      t.string :phone
    end
  end
end
