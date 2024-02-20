class FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @favorite  = Favorite.create(user_id: current_user.id, blog_id: @blog.id)
    redirect_to blogs_path
  end

  def destroy
    # @blog = Blog.find(params[:id])
    # @favorite = Favorite.find_by(user_id: current_user.id, blog_id: @blog.id)
    current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_path
  end

end
