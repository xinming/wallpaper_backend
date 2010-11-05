class DirectoriesController < ApplicationController
  # GET /directories
  # GET /directories.xml
  def index
    @directories = Directory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml do
        result_hash= Array.new
        0.upto(@directories.size() -1) do |directory_id|
          directory = @directories[directory_id]
          hash = Hash.new
          hash[:title] = directory.name
          # hash[:category] = directory.news_category.name.upcase
          hash[:date] = directory.date
          hash[:thumbnail] = directory.image.url(:iphone_thumb).gsub(" ", "%20")
          hash[:url] = "/directory_bb/#{directory.id}"
          hash[:id] = directory.id
          result_hash.push hash
        end
        render :xml => result_hash
      end
      
      
      format.json do
        result_hash= Array.new
        0.upto(@directories.size() -1) do |directory_id|
          directory = @directories[directory_id]
          hash = Hash.new
          hash[:title] = directory.name
          # hash[:category] = directory.news_category.name.upcase
          hash[:date] = directory.date
          hash[:thumbnail] = directory.image.url(:iphone_thumb).gsub(" ", "%20")
          hash[:id] = directory.id
          result_hash.push hash
        end
        render :json => result_hash.to_json
      end
    end
  end

  # GET /directories/1
  # GET /directories/1.xml
  def show
    @directory = Directory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @directory }
      
    end
  end


  def directory_ajax
    @directory = Directory.find(params[:id])
    respond_to do |format|
      format.html {render :template => "directories/show_ajax", :layout => false}
    end
  end
  
  
  def directory_bb
    @directory = Directory.find(params[:id])
    respond_to do |format|
      format.html {render :template => "directories/show_bb", :layout => false}
    end
  end
  
  # GET /directories/new
  # GET /directories/new.xml
  def new
    @directory = Directory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @directory }
    end
  end

  # GET /directories/1/edit
  def edit
    @directory = Directory.find(params[:id])
  end

  # POST /directories
  # POST /directories.xml
  def create
    @directory = Directory.new(params[:directory])

    respond_to do |format|
      if @directory.save
        format.html { redirect_to(@directory, :notice => 'Directory was successfully created.') }
        format.xml  { render :xml => @directory, :status => :created, :location => @directory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @directory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /directories/1
  # PUT /directories/1.xml
  def update
    @directory = Directory.find(params[:id])

    respond_to do |format|
      if @directory.update_attributes(params[:directory])
        format.html { redirect_to(@directory, :notice => 'Directory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @directory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /directories/1
  # DELETE /directories/1.xml
  def destroy
    @directory = Directory.find(params[:id])
    @directory.destroy

    respond_to do |format|
      format.html { redirect_to(directories_url) }
      format.xml  { head :ok }
    end
  end
end
