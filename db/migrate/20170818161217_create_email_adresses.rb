class CreateEmailAdresses < ActiveRecord::Migration[5.1]
  def change
    create_table :email_adresses do |t|
      t.string :adress
      t.integer :person_id

      t.timestamps
    end
  end
end
