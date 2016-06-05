class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def l(time)
    time.strftime("%Y-%m-%d %H:%M")
  end
end
