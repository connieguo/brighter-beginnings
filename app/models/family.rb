class Family < ActiveRecord::Base
  def get_sizes
    return ["2", "3", "4", "5", "5+"]
  end
end
