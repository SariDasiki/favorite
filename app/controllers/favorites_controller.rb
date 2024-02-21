class FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @favorite  = Favorite.create(user_id: current_user.id, blog_id: @blog.id)
    respond_to do |format|
    format.js { render "blogs/favorite" }
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    @blog = favorite.blog
    current_user.favorites.find_by(id: params[:id]).destroy
    
    respond_to do |format|
      format.js { render "blogs/unfavorite" }
    end
  end

end
