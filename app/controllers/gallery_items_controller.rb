class GalleryItemsController < ApplicationController
  # GET /gallery_items
  # GET /gallery_items.xml
  def index
    @gallery_items = GalleryItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gallery_items }
    end
  end

  # GET /gallery_items/1
  # GET /gallery_items/1.xml
  def show
    @gallery_item = GalleryItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery_item }
    end
  end

  # GET /gallery_items/new
  # GET /gallery_items/new.xml
  def new
    @gallery_item = GalleryItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery_item }
    end
  end

  # GET /gallery_items/1/edit
  def edit
    @gallery_item = GalleryItem.find(params[:id])
  end

  # POST /gallery_items
  # POST /gallery_items.xml
  def create
    @gallery_item = GalleryItem.new(params[:gallery_item])

    respond_to do |format|
      if @gallery_item.save
        format.html { redirect_to(@gallery_item, :notice => 'Gallery item was successfully created.') }
        format.xml  { render :xml => @gallery_item, :status => :created, :location => @gallery_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gallery_items/1
  # PUT /gallery_items/1.xml
  def update
    @gallery_item = GalleryItem.find(params[:id])

    respond_to do |format|
      if @gallery_item.update_attributes(params[:gallery_item])
        format.html { redirect_to(@gallery_item, :notice => 'Gallery item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_items/1
  # DELETE /gallery_items/1.xml
  def destroy
    @gallery_item = GalleryItem.find(params[:id])
    @gallery_item.destroy

    respond_to do |format|
      format.html { redirect_to(gallery_items_url) }
      format.xml  { head :ok }
    end
  end


  def filter
    @gallery_items = GalleryItem.where(:gallery_id =>params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @gallery_item }
    end
end


end
