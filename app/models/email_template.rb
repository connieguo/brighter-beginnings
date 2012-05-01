class EmailTemplate < ActiveRecord::Base
  validates_presence_of :editor_name

  def self.get_current_template
    EmailTemplate.find(:first, :order => "created_at DESC")
  end
end
