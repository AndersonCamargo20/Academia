class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]

  before_action :set_pessoa, only: [:update]

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
    @funcionario.build_pessoa
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)


      if @funcionario.save
        flash[:success] = "Funcionario: #{@funcionario.pessoa.nome} Cadastrado com sucesso!"
        redirect_to @funcionario
      else
        flash[:danger] = "Erro ao tentar cadastrar Funcionário!"
        render :new
      end

  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update

      if @funcionario.update(funcionario_params) && @pessoa.update(funcionario2_params)
        flash[:success] = "Funcionario #{@funcionario.pessoa.nome} Editado com sucesso!"
        redirect_to @funcionario
      else
        flash[:danger] = "Erro ao tentar editar Funcionário!"
        render :edit
      end

  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    
    if @funcionario.destroy
      flash[:success] = "Funcionário excluido com sucesso!"
      redirect_to funcionarios_path
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:pessoa_id, :cargo_id, :salario, :dataContratacao, pessoa_attributes: [:nome, :rua, :bairro, :sexo, :telefone, :email])
    end

    def set_pessoa
      @pessoa = Pessoa.find_by(params[@funcionario.pessoa_id])
    end

    def funcionario2_params
      params.require(:funcionario).permit(:nome, :rua, :bairro, :sexo, :telefone, :email)
    end
end
