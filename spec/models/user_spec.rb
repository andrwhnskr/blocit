 require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
      
    end
     it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorited(@post)).to eq(nil)
     end
 
     it "returns the appropriate favorite if it exists" do
      fav = Favorite.create(post: @post, user: @user)
      
      returned_favorite = @user.favorited(@post)

      expect(returned_favorite).to be_a Favorite
      expect(returned_favorite.user).to eq(@user)
      expect(returned_favorite.post).to eq(@post)
      expect(returned_favorite.id).to eq(fav.id)
     end
   end
 end