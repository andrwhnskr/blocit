class CommentsController < ApplicationController
  def create
    @topic = Topic.find( params[:topic_id] )
    @post = @topic.posts.find( params[:post_id] )
    #@comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment created successfully"
    else
      flash[:error] = "Comment creation encountered an error"
      redirect_to [@topic, @post]
    end
    
    # we need to redirect at the end back to post show
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :post_id
    )
  end
end
