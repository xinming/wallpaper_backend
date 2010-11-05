class WelcomeController < ApplicationController
  def redirect_to_iphone
    redirect_to "http://wallpaperth.mobi/iphone/"
  end

  def index
    if request.user_agent.include? "iPhone"
      redirect_to_iphone
      return
    end

    if request.user_agent.include? "BlackBerry"
      redirect_to "http://dlus.mevo.mobi/wallpaper_live/Wallpaper.jad"
      return
    end
  end

end
