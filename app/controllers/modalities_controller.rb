class ModalitiesController < ApplicationController
  before_action :set_modality, only: [:show, :edit, :update, :destroy]

  # GET /modalities
  # GET /modalities.json
  def index
    @modalities = Modality.all
  end

  # GET /modalities/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # GET /modalities/new
  def new
    @modality = Modality.new
    @modality.levels.build
  end

  # GET /modalities/1/edit
  def edit
  end

  # POST /modalities
  # POST /modalities.json
  def create
    @modality = Modality.new(modality_params)

    modality_respond @modality.save, :new
  end

  # PATCH/PUT /modalities/1
  # PATCH/PUT /modalities/1.json
  def update
    modality_respond @modality.update(modality_params), :edit
  end

  # DELETE /modalities/1
  # DELETE /modalities/1.json
  def destroy
    @modality.destroy
    respond_to do |format|
      format.html { redirect_to :modalities, notice: t('.notice', name: @modality.name) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modality
      @modality = Modality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modality_params
      params.require(:modality).permit(:name, :description, levels_attributes: [ :id, :name, :color, :position, :_destroy ])
    end

    def modality_respond(saved, error_view = :edit)
      controller_name = @modality.model_name.plural.to_sym
      respond_to do |format|
        if saved
          format.html { redirect_to controller_name, notice: t('.notice', name: @modality.name) }
          format.json { render :show, status: :ok, location: @modality }
        else
          format.html { render error_view }
          format.json { render json: @modality.errors, status: :unprocessable_entity }
        end
      end
    end
end
