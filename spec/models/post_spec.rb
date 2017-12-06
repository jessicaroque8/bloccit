require 'rails_helper'

RSpec.describe Post, type: :model do
   let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }

 # #2
   describe "attributes" do
     it "has title and body attributes" do
       expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
     end
   end

   describe "censored title" do
      posts = []
      posts << Post.create(title: "New Post Title", body: "New Post Body")
      posts << Post.create(title: "New Post Title", body: "New Post Body")
      posts << Post.create(title: "New Post Title", body: "New Post Body")
      posts << Post.create(title: "New Post Title", body: "New Post Body")
      posts << Post.create(title: "New Post Title", body: "New Post Body")
      posts << Post.create(title: "New Post Title", body: "New Post Body")

      it "has the title SPAM if it its the first post" do
         expect(posts[0]).to have_attributes(id: "1", title: "SPAM", body: "New Post Body")
      end

      it "has the title SPAM if its index is divisible by 5" do
         expect(posts[5]).to have_attributes(id: "6", title: "SPAM", body: "New Post Body")
      end
   end


end
