class Post < ApplicationRecord
   has_many :comments

   def censor
     if self.id == 1
        self.title == 'SPAM'
     elsif (self.id - 1) % 5 == 0
         self.title == 'SPAM'
      end
   end

   self.censor

end
