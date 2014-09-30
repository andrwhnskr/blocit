class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite

    if favorite.save
      flash[:notice] = "Post was favorited"
      redirect_to [@post.topic, @post]
     else
      flash[:error] = "There was an error favoriting this post"
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find(params[:id])

    authorize favorite

    if @favorite.destroy
      flash[:notice] = "Post was unfavorited"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error unfavoriting this post"
      redirect_to [@post,topic, @post]
    end
  end

end
