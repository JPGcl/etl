class DesechadosController < ApplicationController
  before_action :set_desechado, only: %i[ show edit update destroy ]

  # GET /desechados or /desechados.json
  def index
    @desechados = Desechado.all
  end

  # GET /desechados/1 or /desechados/1.json
  def show
  end

  # GET /desechados/new
  def new
    @desechado = Desechado.new
  end

  # GET /desechados/1/edit
  def edit
  end

  # POST /desechados or /desechados.json
  def create
    @desechado = Desechado.new(desechado_params)

    respond_to do |format|
      if @desechado.save
        format.html { redirect_to desechado_url(@desechado), notice: "Desechado was successfully created." }
        format.json { render :show, status: :created, location: @desechado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @desechado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desechados/1 or /desechados/1.json
  def update
    respond_to do |format|
      if @desechado.update(desechado_params)
        format.html { redirect_to desechado_url(@desechado), notice: "Desechado was successfully updated." }
        format.json { render :show, status: :ok, location: @desechado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @desechado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desechados/1 or /desechados/1.json
  def destroy
    @desechado.destroy

    respond_to do |format|
      format.html { redirect_to desechados_url, notice: "Desechado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desechado
      @desechado = Desechado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def desechado_params
      params.require(:desechado).permit(:origen, :in_1, :in_2, :in_3, :error)
    end
end
