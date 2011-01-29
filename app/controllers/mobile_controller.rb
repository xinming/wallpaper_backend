class MobileController < ApplicationController
  def iphone_cover
    render :layout=>false
  end
  
  # JSON
  # def article_categories
  #   categories = ArticleCategory.all
  #   list = Array.new
  #   categories.each do |category|
  #     list.push (:category_id => category.id, :name => category.name, :category_url => "/mobile/article_category/#{category.id}.json" )
  #   end
  #   render :json => list.to_json
  # end
  # 
  # def news
  #   list = Array.new
  #   News.all.each do |news|
  #     
  #   end
  # end
  
  # JSON 
  # match 'mobile/article_category/:id.json' => 'mobile#article_category'
  # def article_category
  #   id = params[:id]
  #   article_category = ArticleCategory.find(id)
  #   articles_list = Array.new
  #   
  # 
  #   
  #   article_category.articles.each do |article|
  #     # PUBSLISHED ONLY
  #     next if article.is_published == false
  #     gallery_result = Array.new
  #     article.galleries.each do |gallery|
  #       # SHOWN GALLERY ONLY
  #       next if gallery.hide == true
  #       gallery.gallery_items.each do |item|
  #         hash = Hash.new
  #         hash[:gallery_src]   = URI.escape item.image.url(:iphone_gallery)
  #         hash[:caption]       = item.description
  #         hash[:caption] = nil if hash[:caption] == ""
  #         gallery_result.push hash
  #       end
  #     end
  #     
  #     gallery_result = nil if gallery_result == []
  # 
  # 
  #     article_result = Hash.new
  #     article_result[:title]    =  article.title
  #     article_result[:subtitle] =  article.subtitle
  #     article_result[:date]     =  article.date
  #     article_result[:gallery]  =  gallery_result
  #     article_result[:type] = "article"
  #     article_result[:html_src] = "/mobile/article/#{article.id}.html"
  #     article_result[:thumbnail_src] = URI.escape(article.galleries[0].gallery_items[0].image.url(:iphone_thumb).gsub(/\?[0-9]+$/, ""))
  #     articles_list.push article_result
  #     
  #   end
  #   
  #   if id == "1"
  #     article_result = Hash.new
  #     article_result[:type] = "advertisement"
  #     article_result[:html_src] = "http://www.google.com/"
  #     article_result[:thumbnail_src] = "/iphone/images/INOA_banner.png"
  #     articles_list.insert 2, article_result
  #   end
  #   
  #   render :json =>  articles_list.to_json
  # end
  
  
  def news
    articles_list = Array.new
    News.all.each do |article|
      article_result = Hash.new
      article_result[:title]    =  article.title
      article_result[:subtitle] =  "#{article.news_category.name} | #{article.date}"
      article_result[:date]     =  article.date
      article_result[:gallery]  =  nil
      article_result[:type] = "article"
      article_result[:html_src] = "/mobile/news/#{article.id}.html"
      article_result[:thumbnail_src] = URI.escape(article.news.url(:iphone_thumb).gsub(/\?[0-9]+$/, ""))
      articles_list.push article_result
    end
    render :json =>  articles_list.to_json
  end
  
  
  def videos
    articles_list = Array.new
    Video.all.each do |article|
      article_result = Hash.new
      article_result[:title]    =  article.title
      article_result[:subtitle] =  "#{article.date}"
      article_result[:date]     =  article.date
      article_result[:gallery]  =  nil
      article_result[:type] = "article"
      article_result[:html_src] = "/mobile/video/#{article.id}.html"
      article_result[:thumbnail_src] = URI.escape(article.image.url(:iphone_thumb).gsub(/\?[0-9]+$/, ""))
      articles_list.push article_result
    end
    render :json =>  articles_list.to_json
  end
    
  def directories
    articles_list = Array.new
    Directory.all.each do |article|
      article_result = Hash.new
      article_result[:title]    =  article.name
      article_result[:subtitle] =  "#{article.date}"
      article_result[:date]     =  article.date
      article_result[:gallery]  =  nil
      article_result[:type] = "article"
      article_result[:html_src] = "/mobile/directory/#{article.id}.html"
      article_result[:thumbnail_src] = URI.escape(article.image.url(:iphone_thumb).gsub(/\?[0-9]+$/, ""))
      articles_list.push article_result
    end
    render :json =>  articles_list.to_json
  end
  
  
  def galleries
    result= Array.new
    Gallery.all.each do |gallery|
      
      gallery_result = Hash.new
      
      gallery_items_result = Array.new
      gallery.gallery_items.each do |item|
        hash = Hash.new
        hash[:gallery_src]   = URI.escape item.image.url(:iphone_gallery).gsub(/\?.*$/, "")
        hash[:caption]       = item.description
        hash[:caption] = nil if hash[:caption] == ""
        gallery_items_result.push hash
      end
      
      gallery_result[:title] = gallery.title
      gallery_result[:subtitle] = gallery.date
      gallery_result[:date] = gallery.date
      gallery_result[:thumbnail_src] = URI.escape gallery.gallery_items[0].image.url(:iphone_thumb).gsub(/\?.*$/, "")
      gallery_result[:gallery]  =  gallery_items_result
      gallery_result[:type] = "article"
      gallery_result[:html_src] = "/mobile/gallery/#{gallery.id}.html"
      result.push gallery_result
    end
    render :json => result.to_json
  end
  
  def get_gallery
    @gallery = Gallery.find(params[:id])
    render :layout => false
  end

  def get_news
    @news = News.find(params[:id])
    render :layout => false
  end
  
  def get_video
    @video = Video.find(params[:id])
    render :layout => false
  end

  def get_directory
    @directory = Directory.find(params[:id])
    render :layout => false
  end
  
  
  
  def article
    @article = Article.find(params[:id])
    
    @galleries = []
    @article.galleries.each do |gallery|
      @galleries.push gallery if gallery.hide != true
    end
    
    render :layout => false 
  end
  
end
