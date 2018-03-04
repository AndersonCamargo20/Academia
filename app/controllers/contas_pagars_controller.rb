class ContasPagarsController < ApplicationController
  before_action :set_contas_pagar, only: [:show, :edit, :update, :destroy]

  def index
    @contas_pagars = ContasPagar.all
    @date = DateTime.now
    @soma = 0
    @contas_pagars.each do |conta|
       @soma += conta.valor if conta && conta.valor && !conta.pago?
    end
  end

  def show
  end

  def new
    @contas_pagar = ContasPagar.new
  end
t
  def edit
  end

  def create
    @contas_pagar = ContasPagar.new(contas_pagar_params)
      if @contas_pagar.save
        flash[:success] = "Conta salva com sucesso!"
        redirect_to @contas_pagar
      else
        flash[:danger] = "Erro ao tentar cadastrar Conta!"
        render :new
      end
  end

  def update
      if @contas_pagar.update(contas_pagar_params)
        flash[:success] = "Conta editada com sucesso!"
        redirect_to @contas_pagar
      else
        flash[:danger] = "Erro ao tentar editar conta!"
        render :edit
      end
  end

  def destroy
    if @contas_pagar.destroy
      flash[:success] = "Conta excluida com sucesso!"
      redirect_to contas_pagars_path
    else
      flash[:danger] = "Erro ao tentar excluir conta!"
      redirect_to contas_pagars_path
    end
  end

  private
    def set_contas_pagar
      @contas_pagar = ContasPagar.find(params[:id])
    end

    def contas_pagar_params
      params.require(:contas_pagar).permit(:valor, :data_pagamento, :pago, :fornecedor_id)
    end
end
