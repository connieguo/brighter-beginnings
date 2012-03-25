class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :size
      t.string :location
      t.string :surname
      t.timestamps
    end
  end
end
