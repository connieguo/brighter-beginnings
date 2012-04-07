class CreateFamilies < ActiveRecord::Migration
  def up
    create_table :families do |t|
      t.string :location
      t.boolean :display
      t.text :profile
      t.timestamps
    end
  end
  def down
    drop_table :families
  end
end
