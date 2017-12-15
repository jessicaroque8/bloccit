module UsersHelper

   def has_posts
      unless @user.posts.exists?
         return "#{@user.name} has not submitted any posts yet."
      else
         return "Posts"
      end
   end

   def has_comments
      unless @user.comments.exists?
         return "#{@user.name} has not submitted any comments yet."
      else
         return "Comments"
      end
   end

end
