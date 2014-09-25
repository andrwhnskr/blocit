class CommentsController < ApplicationController
  def create
    @post = Post.find( params[:post_id] )
    #@comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment created successfully"
    else
      flash[:error] = "Comment creation encountered an error"
      redirect_to [@post.topic, @post]
    end
    
    # we need to redirect at the end back to post show
  end

  def destroy
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :post_id
    )
  end
end
