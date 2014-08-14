class AnnotationsController < ApplicationController
  before_action :set_annotation, only: [:show, :edit, :update, :destroy]




  # TODO This class is under construction.  Nonthing has been tested.





  # # GET /annotations
  # # GET /annotations.json
  # def index
  #   @annotations = Annotation.all
  # end


  # GET /works/1/annotations/1
  # GET /works/1/annotations/1.json
  # GET /works/1/annotations/1.nt
  def show
    set_work
    respond_to do |format|
      format.html
      format.json { render json: @annotation }
      format.nt  { render ntriples:  @annotation.to_ntriples}
    end
    # get_from_triplestore
  end

  # GET /works/1/annotations/new
  def new
    logger.debug("*** Entering AnnotationsController::new")
    logger.debug("   new -- params=#{params}")
    @annotation = Annotation.new
    set_work
  end

  # GET /works/1/annotations/1/edit
  def edit
    set_work
  end

  # POST /works/1/annotations
  # POST /works/1/annotations.json
  def create
    @annotation = Annotation.new(annotation_params)
    set_work
    respond_to do |format|
      if @annotation.save
        format.html { redirect_to work_path(@annotation.bibid), notice: 'Annotation was successfully created.' }
        format.json { render :show, status: :created, location: @annotation }
      else
        format.html { render :new }
        format.json { render json: @annotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1/annotations/1
  # PATCH/PUT /works/1/annotations/1.json
  def update
    # set_work

    respond_to do |format|
      if @annotation.update(annotation_params)
        format.html { redirect_to work_path(@annotation.bibid), notice: 'Annotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @annotation }
      else
        format.html { render :edit }
        format.json { render json: @annotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1/annotations/1
  # DELETE /works/1/annotations/1.json
  def destroy
    bibid = params["work_id"]
    @annotation.destroy

    respond_to do |format|
      format.html { redirect_to work_path(bibid), notice: 'Annotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annotation
#      logger.debug("*** Entering AnnotationsController::set_annotation")

      annotations = Annotation.find(:pid=>params["id"])
      @annotation = ( annotations.size > 0 ) ? annotations[0] : annotations
#      logger.debug("********* annotation... #{@annotation}")
    end

    # Common method used by callbacks to setup work inside annotation object
    def set_work
      logger.debug("*** Entering AnnotationsController::set_work")
      logger.debug("********* params... #{params}")

      work = Work.new
      work.find_and_fill(params["work_id"])
      @annotation.work = work

      logger.debug("********* work... #{work}")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annotation_params
      # logger.debug("*** Entering AnnotationsController::annotation_params")
      # logger.debug("********* params... #{params}")
      limited_params = params.require(:annotation).permit(:annotation)
      limited_params["bibid"] = params["bibid"]
      # logger.debug("********* limited_params... #{limited_params}")
      limited_params
    end
 end
