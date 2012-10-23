class ChangeAgeType < ActiveRecord::Migration
  def up
    rename_column :family_members, :age, :age_temp
    add_column :family_members, :age, :string
    FamilyMember.reset_column_information
    FamilyMember.find_each { |f| f.update_attribute(:age, f.age_temp) }
    remove_column :family_members, :age_temp
  end

  def down
  end
end
