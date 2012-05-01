class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.text :template_body
      t.string :editor_name
      
      t.timestamps
    end
  end
end
