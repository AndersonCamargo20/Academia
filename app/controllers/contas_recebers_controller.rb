class ContasRecebersController < ApplicationController
  before_action :set_contas_receber, only: [:show, :edit, :update, :destroy]
  #ANTES DE EXECUTAR AS actions LISTADAS DEVE-SE EXECUTAR O MÉTODO set_contas_receber

  def index # ACTIONQUE REDIRECIONA PARA A VIEW INDEX
    @contas_recebers = ContasReceber.all 
    # UTILIZA A CLASS ContasReceber da Model com o método all para buscar todos os registros da tabela
    @date= DateTime.now # BUSCA A DATA ATUAL E ARMAZENA NA VARIAVEL DE ESTÂNCIA
    @soma=0 
    @contas_recebers.each do |conta| # LAÇO each PARA PERCORRER O ARRAY QUE POSSUI TODO SO SREGISTROS DA TABELA E FAZER A SOMA DAS CONTAS QUE NÃO FORAM PAGAS
        @soma += conta.valor if conta && conta.valor && !conta.pago?
      end
  end

  def show # ACTION QUE REDIRECIONA PARA A VIEW show  E ESTÁ LISTA NO BEFORE ACTION NA LINHA 2
  end

  def new 
    @contas_receber = ContasReceber.new # INSTÂNCIA UM NOVO OBJ DO TIPO ContasReceber
  end
  
  def edit # ACTION QUE REDIRECIONA PARA A VIEW edit  E ESTÁ LISTA NO BEFORE ACTION NA LINHA 2
  end

  def create # ACTION CHAMADA ATRAVÉS DO SUBMIT DO FORMULÁRIO DA VIEW _form 
    @contas_receber = ContasReceber.new(contas_receber_params) # UTILIZA OS PARÂMETROS DO FORMULÁRIO E CRIA UMOBJ COM TODOS OS ATRIBUTOS DO FORMULÁRIO 

    if @contas_receber.save #TESTA SE FOI SALVO COM SUCESSO
      flash[:success] = "Conta salva com sucesso!"
      redirect_to @contas_receber # REDIRECIONA PARA O SHOW DAQUELA CONTA CRIADA
    else
      render :new   #CASO DE QUALQUER TIPO DE ERRO RETORNA CARREGA A MESMA PÁGINA E MOSTRA QUAIS SÃO OS ERROS UTILIZANDO OS VALIDATES DA MODEL
    end
  end

  def update # ACTION CHAMADA ATRAVÉS DO SUBMIT DO EDIT DO FORMULÁRIO DA VIEW _form 
      if @contas_receber.update(contas_receber_params) #UTILIZA O MÉTODO UPDATE PARA ATUALIZAR OS DADOS DO REGISTROS E JÁ SALVAR NO DB
        flash[:success] = "Conta editada com sucesso!"
        redirect_to @contas_receber # REDIRECIONA PARA O SHOW DAQUELA CONTA ATUALIZADA
      else
        flash[:danger] = "Erro ao tentar editar a conta!"
        render :edit #CASO DE QUALQUER TIPO DE ERRO RETORNA CARREGA A MESMA PÁGINA E MOSTRA QUAIS SÃO OS ERROS UTILIZANDO OS VALIDATES DA MODEL
      end
  end

  def destroy
    if @contas_receber.destroy #TESTA SE O REGISTRO FOI EXCLUIDO COM SUCESSO!
      flash[:success] = "Conta excluida com sucesso"
      redirect_to contas_recebers_path #REDIRECIONA PARA O INDEX POIS O CAMINHO ESTÁ NO PLURAL
    else
      flash[:danger] = "Erro ao tentar excluir conta"
      redirect_to contas_recebers_path #REDIRECIONA PARA O INDEX POIS O CAMINHO ESTÁ NO PLURAL MESMO QUE ESTE TENHA DADO ERRO
    end
  end

  private
    def set_contas_receber # MÉTODO CHAMADO NO before_action NA LINHA 02
      @contas_receber = ContasReceber.find(params[:id]) # BUSCA UMA CONTA ATRVÉS DO ID DO REGISTRO NO DB UTILIZANDO A CLASSE DA MODEL DESTE, 
    end

    def contas_receber_params # MÉTODO RESPONSÁVEL POR COLHER NO FORMULÁRIO, OS ATRIBUTOS QUE SERÃO SALVO NO DB
      params.require(:contas_receber).permit(:aluno_id, :data_recebimento, :pago, :valor)
    end
end
