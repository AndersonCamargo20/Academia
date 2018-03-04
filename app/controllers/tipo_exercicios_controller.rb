class TipoExerciciosController < ApplicationController
  before_action :set_tipo_exercicio, only: [:show, :edit, :update, :destroy]

  # GET /tipo_exercicios
  # GET /tipo_exercicios.json
  def index
    @tipo_exercicios = TipoExercicio.all
  end

  # GET /tipo_exercicios/1
  # GET /tipo_exercicios/1.json
  def show
  end

  # GET /tipo_exercicios/new
  def new
    @tipo_exercicio = TipoExercicio.new
  end

  # GET /tipo_exercicios/1/edit
  def edit
  end

  # POST /tipo_exercicios
  # POST /tipo_exercicios.json
  def create
    @tipo_exercicio = TipoExercicio.new(tipo_exercicio_params)

    respond_to do |format|
      if @tipo_exercicio.save
        format.html { redirect_to @tipo_exercicio, notice: 'Tipo exercicio was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_exercicio }
      else
        format.html { render :new }
        format.json { render json: @tipo_exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_exercicios/1
  # PATCH/PUT /tipo_exercicios/1.json
  def update
    respond_to do |format|
      if @tipo_exercicio.update(tipo_exercicio_params)
        format.html { redirect_to @tipo_exercicio, notice: 'Tipo exercicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_exercicio }
      else
        format.html { render :edit }
        format.json { render json: @tipo_exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_exercicios/1
  # DELETE /tipo_exercicios/1.json
  def destroy
    @tipo_exercicio.destroy
    respond_to do |format|
      format.html { redirect_to tipo_exercicios_url, notice: 'Tipo exercicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_exercicio
      @tipo_exercicio = TipoExercicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_exercicio_params
      params.require(:tipo_exercicio).permit(:descricaoExercicio)
    end
end
