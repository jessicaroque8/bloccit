class FavoriteMailer < ApplicationMailer
   default from: "jroque.dev@gmail.com"

   def new_comment(user, post, comment)

     headers["Message-ID"] = "<comments/#{comment.id}@lit-escarpment-47834.herokuapp.com>"
     headers["In-Reply-To"] = "<post/#{post.id}@lit-escarpment-47834.herokuapp.com>"
     headers["References"] = "<post/#{post.id}@lit-escarpment-47834.herokuapp.com>"

     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, cc: "jessicaroque4894@gmail.com", subject: "New comment on #{post.title}")
   end

   def new_post(post)
     headers["Message-ID"] = "<post/#{post.id}@lit-escarpment-47834.herokuapp.com>"
     headers["In-Reply-To"] = "<post/#{post.id}@lit-escarpment-47834.herokuapp.com>"
     headers["References"] = "<post/#{post.id}@lit-escarpment-47834.herokuapp.com>"

     @post = post

     mail(to: post.user.email, cc: "jessicaroque4894@gmail.com", subject: "You'll receive updates on your new post: #{post.title}")
   end
end
