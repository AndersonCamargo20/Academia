class ExameFisicosController < ApplicationController
  before_action :set_exame_fisico, only: [:show, :edit, :update, :destroy]

  def index # ACTIONQUE REDIRECIONA PARA A VIEW INDEX
    @exame_fisicos = ExameFisico.all
    # UTILIZA A CLASS ExameFisico da Model com o método all para buscar todos os registros da tabela
  end

  def show# ACTION QUE REDIRECIONA PARA A VIEW show  E ESTÁ LISTA NO BEFORE ACTION NA LINHA 2
  end

  def new
    @exame_fisico = ExameFisico.new# INSTÂNCIA UM NOVO OBJ DO TIPO ExameFisico
  end

  def edit# ACTION QUE REDIRECIONA PARA A VIEW edit  E ESTÁ LISTA NO BEFORE ACTION NA LINHA 2
  end

  def create # ACTION CHAMADA ATRAVÉS DO SUBMIT DO FORMULÁRIO DA VIEW _form 
    @exame_fisico = ExameFisico.new(exame_fisico_params)# UTILIZA OS PARÂMETROS DO FORMULÁRIO E CRIA UM OBJ COM TODOS OS ATRIBUTOS DO FORMULÁRIO
    if @exame_fisico.save #TESTA SE FOI SALVO COM SUCESSO
      flash[:success] = "Exame cadastrado com sucesso"
      redirect_to @exame_fisico# REDIRECIONA PARA O SHOW DAQUELE EXAME CRIADA
    else
      render :new #CASO DE QUALQUER TIPO DE ERRO RETORNA CARREGA A MESMA PÁGINA E MOSTRA QUAIS SÃO OS ERROS UTILIZANDO OS VALIDATES DA MODEL
    end
  end

  def update# ACTION CHAMADA ATRAVÉS DO SUBMIT DO EDIT DO FORMULÁRIO DA VIEW _form
    if @exame_fisico.update(exame_fisico_params)#UTILIZA O MÉTODO UPDATE PARA ATUALIZAR OS DADOS DO REGISTROS E JÁ SALVAR NO DB
      flash[:success] = "exame editado com sucesso"
       redirect_to @exame_fisico # REDIRECIONA PARA O SHOW DAQUELA CONTA ATUALIZADA
    else
       render :edit#CASO DE QUALQUER TIPO DE ERRO RETORNA CARREGA A MESMA PÁGINA E MOSTRA QUAIS SÃO OS ERROS UTILIZANDO OS VALIDATES DA MODEL
    end
  end

  def destroy
    if @exame_fisico.destroy#TESTA SE O REGISTRO FOI EXCLUIDO COM SUCESSO!
      flash[:success] = "Exame excluido com sucesso"
      redirect_to exame_fisicos_path#REDIRECIONA PARA O INDEX POIS O CAMINHO ESTÁ NO PLURAL
    else
      flash[:danger] = "Erro ao tentar excluir"
      redirect_to exame_fisicos_path#REDIRECIONA PARA O INDEX POIS O CAMINHO ESTÁ NO PLURAL MESMO QUE ESTE TENHA DADO ERRO
    end
  end


  private
    def set_exame_fisico# MÉTODO CHAMADO NO before_action NA LINHA 02
      @exame_fisico = ExameFisico.find(params[:id])# BUSCA UMA CONTA ATRVÉS DO ID DO REGISTRO NO DB UTILIZANDO A CLASSE DA MODEL DESTE,
    end

    def exame_fisico_params # MÉTODO RESPONSÁVEL POR COLHER NO FORMULÁRIO, OS ATRIBUTOS QUE SERÃO SALVO NO DB
      params.require(:exame_fisico).permit(:aluno_id, :funcionario_id, :dataExame, :peso, :altura, :altura, :imc, :busto, :cintura)
    end
end
