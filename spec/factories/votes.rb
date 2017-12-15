FactoryBot.define do
   val = [-1,1].sample
   
   factory :vote do
     value val
     user
     post
   end
 end
