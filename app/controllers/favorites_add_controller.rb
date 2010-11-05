class FavoritesAddController < ApplicationController
 def index
   @user_id = params[:user_id]
   @news_id = params[:news_id]
  # Favorite.create(:user_id => @user_id, :news_id =>@news_id )
 end
end
