class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  before_action :set_pessoa, only: [:update]

  def index
    @alunos = Aluno.all
  end


  def show
  end


  def new
    @aluno = Aluno.new
    @aluno.build_pessoa
  end

  def edit
  end


  def create

    @aluno = Aluno.new(aluno_params)
    
    if @aluno.save
      flash[:success] = "Aluno: #{@aluno.pessoa.nome} Cadastrado com sucesso! "
      redirect_to @aluno
    else
      flash[:danger] = "ERRO ao tentar cadastrar o Aluno!"
      render :new
    end

  end


  def update
    
    if @aluno.update(aluno_params) && @pessoa.update(aluno2_params)
      flash[:success] = "Aluno #{@aluno.pessoa.nome} Atualizado com sucesso!"
      redirect_to alunos_path  
    else
      flash[:danger] = "Ocorreu um erro ao tentar editar o Aluno!"
      render :edit 
    end

  end


  def destroy

    if @aluno.destroy
      flash[:success] = "Aluno excluido com sucess!"
      redirect_to alunos_path
    end

  end

  private

    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    def aluno_params
      params.require(:aluno).permit(:pessoa_id, :ativo, :matricula, pessoa_attributes: [:nome, :rua, :bairro, :sexo, :telefone, :email])
    end

    def aluno2_params
      params.require(:aluno).permit(:nome, :rua, :bairro, :sexo, :telefone, :email)
    end

    def set_pessoa
      @pessoa = Pessoa.find_by(params[@aluno.pessoa_id])
    end
end
