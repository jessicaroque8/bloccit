class Question < ApplicationRecord

   after_initialize :set_default, unless: :persisted?

   def set_default
      self.resolved = false if self.resolved.nil?
   end

end
