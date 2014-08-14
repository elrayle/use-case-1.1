class VirtualCollectionsController < ApplicationController
  before_action :set_virtual_collection, only: [:show, :edit, :update, :destroy]




  # TODO This class is under construction.  Nonthing has been tested.
  # TODO Views have been generated with rails scaffold and tweaked a bit, but not completely coded or tested.




  # Instance variables needed to be able to populate the virtual collection index page.
  attr_accessor :my_collections
  attr_accessor :my_watchlist
  attr_accessor :selected_collection_id
  attr_accessor :selected_collection_items
  attr_accessor :items_per_page
  attr_accessor :sort_by
  attr_accessor :messages


  # GET /virtual_collections
  # GET /virtual_collections.json
  def index
    # Primary view listing all virtual collections and showing items in the selected virtual collection.do

    @virtual_collections = VirtualCollection.all
  end

  # GET /virtual_collections/1
  # GET /virtual_collections/1.json
  def show
    # User selected (i) beside a specific virtual collection in the primary view listing (see index)
    # and the view metadata AJAX dialog shows existing metadata

  end

  # GET /virtual_collections/new
  def new
    # User selected + beside My Virtual Collections list in the primary view listing (see index)
    # and the new virtual collection AJAX dialog appears

    @virtual_collection = VirtualCollection.new
  end

  # GET /virtual_collections/1/edit
  def edit
    # User selected [Edit] button on view metadata AJAX dialog (see show)
    # TODO: OR does user immediately have the ability to edit in the view metadata AJAX dialog if they have privileges to edit?

  end

  # POST /virtual_collections
  # POST /virtual_collections.json
  def create
    # Called when user clicks [Save/Create] button in new virtual collection AJAX dialog (see new)

    @virtual_collection = VirtualCollection.new(virtual_collection_params)

    respond_to do |format|
      if @virtual_collection.save
        format.html { redirect_to @virtual_collection, notice: 'Virtual collection was successfully created.' }
        format.json { render :show, status: :created, location: @virtual_collection }
      else
        format.html { render :new }
        format.json { render json: @virtual_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_collections/1
  # PATCH/PUT /virtual_collections/1.json
  def update
    # Called when user clicks [Save/Update] button in edit metadata AJAX dialog (see edit)

    respond_to do |format|
      if @virtual_collection.update(virtual_collection_params)
        format.html { redirect_to @virtual_collection, notice: 'Virtual collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @virtual_collection }
      else
        format.html { render :edit }
        format.json { render json: @virtual_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_collections/1
  # DELETE /virtual_collections/1.json
  def destroy
    # Called when user clicks [X] button beside a specific virtual collection in the primary view listing.
    # Displays an AJAX confirmation dialog.

    @virtual_collection.destroy
    respond_to do |format|
      format.html { redirect_to virtual_collections_url, notice: 'Virtual collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_collection
      @virtual_collection = VirtualCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def virtual_collection_params
      params[:virtual_collection]
    end

end
