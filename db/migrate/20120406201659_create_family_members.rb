class CreateFamilyMembers < ActiveRecord::Migration
  def up
    create_table :family_members do |t|
      t.string :family_code
      t.string :firstname
      t.integer :age
      t.string :gender
      t.text :comment
      t.string :pant_size
      t.string :shirt_size
      t.string :dress_size
      t.string :shoe_size
      t.text :wishlist
      t.string :family_code
      t.timestamps
    end
  end
  def down
    drop_table :family_members
  end
end
