class NewsController < ApplicationController
  # GET /news
  # GET /news.xml
  def index
    @news = News.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml do  # BB
        result=Array.new
        @news.each do |news|
          hash = Hash.new
          hash[:title] = news.title
          hash[:subtitle] = news.subtitle
          hash[:date] = news.date
          hash[:image] = news.news.url(:iphone_thumb)
          hash[:url] = "/news_bb/#{news.id}"
          result.push hash
        end
        render :xml => result
      end
      
      # IPHONE VIEW INDEX
      format.json do
        result_hash= Array.new
        0.upto(@news.size() -1) do |news_id|
          news = @news[news_id]
          hash = Hash.new
          hash[:title] = news.title
          hash[:category] = news.news_category.name.upcase
          hash[:date] = news.date
          if news_id == 0
            hash[:thumbnail] = news.news.url(:iphone)
          else
            hash[:thumbnail] = news.news.url(:iphone_thumb)
          end
          hash[:id] = news.id
          result_hash.push hash
        end
        render :json => result_hash.to_json
      end
      
      
      
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml{
        
      }
    end
  end

  def news_ajax
    @news = News.find(params[:id])
    
    respond_to do |format|
      format.html {render :template => "news/show_ajax", :layout => false}
    end
  end
  
  
  def news_bb
    @news = News.find(params[:id])
    
    respond_to do |format|
      format.html {render :template => "news/show_bb", :layout => false}
    end
  end
  
  # GET /news/new
  # GET /news/new.xml
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.xml
  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to(@news, :notice => 'News was successfully created.') }
        format.xml  { render :xml => @news, :status => :created, :location => @news }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.xml
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to(@news, :notice => 'News was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.xml
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(news_index_url) }
      format.xml  { head :ok }
    end
  end
end
