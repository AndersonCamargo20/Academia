class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :edit, :update, :destroy]

  def index
    @cargos = Cargo.all
  end

  def show
  end

  def new
    @cargo = Cargo.new
  end

  def edit
  end

  def create
    @cargo = Cargo.new(cargo_params)

      if @cargo.save
        flash[:success] = "Cargo: #{@cargo.descricaoCargo} cadastrado com sucesso"
        redirect_to @cargo
      else
        flash[:danger] = "Erro ao tentar cadastrar cargo!"
        render :new
      end
  end

  def update
    respond_to do |format|
      if @cargo.update(cargo_params)
        flash[:success] = "Cargo: #{@cargo.descricaoCargo} editado com sucesso"
        redirect_to @cargo
      else
        flash[:danger] = "Erro ao tentar editar cargo!"
        render :edit
      end
    end
  end

  def destroy
    
    if @cargo.destroy
      flash[:success] = "Cargo excluido com sucesso!"
      redirect_to cargos_path
    end
  end

  private
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end

    def cargo_params
      params.require(:cargo).permit(:descricaoCargo)
    end
end
