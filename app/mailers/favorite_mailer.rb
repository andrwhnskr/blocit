class FavoriteMailer < ActionMailer::Base
  default from: "andrw.hnskr@gmail.com"

    def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@hunsakerblocit.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@hunsakerblocit.example>"
     headers["References"] = "<post/#{post.id}@hunsakerblocit.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
