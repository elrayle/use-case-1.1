class VirtualCollectionItemsController < ApplicationController
  before_action :set_virtual_collection_item, only: [:show, :edit, :update, :destroy]




  # TODO This class is under construction.  Nonthing has been tested.
  # TODO Views have been generated with rails scaffold and tweaked a bit, but not completely coded or tested.




  # Instance variables needed to hold information about each item needed for display in the list of items on the
  # My Virtual Collections page.
  attr_accessor :title
  attr_accessor :author
  attr_accessor :pub_date
  attr_accessor :description
  attr_accessor :location
  attr_accessor :thumbnail
  attr_accessor :comments
  attr_accessor :comments_show
  attr_accessor :tags

  # GET /virtual_collection_items
  # GET /virtual_collection_items.json
  def index
    # Used by VirtualCollection.index to get a list of all items in the selected virtual collection

    @virtual_collection_items = VirtualCollectionItem.all
  end

  # GET /virtual_collection_items/1
  # GET /virtual_collection_items/1.json
  def show
    # NOT USED
  end

  # GET /virtual_collection_items/new
  def new
    # Two UI changes to blacklight-cornell
    # 1) Extend search results page to include drop list of virtual collections the user owns with the form submit
    #    going to the create method of this class
    # 2) Extend individual bibliographic work page to include drop list of virtrual collections the user owns with the
    #    form submit going to the create method of this class

    @virtual_collection_item = VirtualCollectionItem.new
  end

  # GET /virtual_collection_items/1/edit
  def edit
    # TODO: The only edit that can happen for an item is to move it to a different virtual collection.  Details TBA.
  end

  # POST /virtual_collection_items
  # POST /virtual_collection_items.json
  def create
    # 1) User is viewing a single bibliographic work and selects a virtual collection from the drop list of all virtual
    #    collections the user owns
    # 2) User is viewing search results, clicks 'selected' checkbox for one or more bibliographic works, and selects a
    #    virtual collection from the drop list of all virtual collections the user owns

    # Questions: How does UI pass the array of bibids and the id of the selected virtual collection to this method?

  @virtual_collection_item = VirtualCollectionItem.new(virtual_collection_item_params)

    respond_to do |format|
      if @virtual_collection_item.save
        format.html { redirect_to @virtual_collection_item, notice: 'Virtual collection item was successfully created.' }
        format.json { render :show, status: :created, location: @virtual_collection_item }
      else
        format.html { render :new }
        format.json { render json: @virtual_collection_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_collection_items/1
  # PATCH/PUT /virtual_collection_items/1.json
  def update
    # TODO: The only edit that can happen for an item is to move it to a different virtual collection.  Details TBA.

    respond_to do |format|
      if @virtual_collection_item.update(virtual_collection_item_params)
        format.html { redirect_to @virtual_collection_item, notice: 'Virtual collection item was successfully updated.' }
        format.json { render :show, status: :ok, location: @virtual_collection_item }
      else
        format.html { render :edit }
        format.json { render json: @virtual_collection_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_collection_items/1
  # DELETE /virtual_collection_items/1.json
  def destroy
    # Called when user clicks [X] button beside a specific item in the selected virtual collection in the primary view
    # listing of the Virtual Collection class (see VirtualCollectionsController.index).
    # Displays an AJAX confirmation dialog.

    @virtual_collection_item.destroy
    respond_to do |format|
      format.html { redirect_to virtual_collection_items_url, notice: 'Virtual collection item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_collection_item
      @virtual_collection_item = VirtualCollectionItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def virtual_collection_item_params
      params[:virtual_collection_item]
    end
end
