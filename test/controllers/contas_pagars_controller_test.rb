require 'test_helper'

class ContasPagarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contas_pagar = contas_pagars(:one)
  end

  test "should get index" do
    get contas_pagars_url
    assert_response :success
  end

  test "should get new" do
    get new_contas_pagar_url
    assert_response :success
  end

  test "should create contas_pagar" do
    assert_difference('ContasPagar.count') do
      post contas_pagars_url, params: { contas_pagar: { data_pagamento: @contas_pagar.data_pagamento, descricao: @contas_pagar.descricao, pago: @contas_pagar.pago, valor: @contas_pagar.valor } }
    end

    assert_redirected_to contas_pagar_url(ContasPagar.last)
  end

  test "should show contas_pagar" do
    get contas_pagar_url(@contas_pagar)
    assert_response :success
  end

  test "should get edit" do
    get edit_contas_pagar_url(@contas_pagar)
    assert_response :success
  end

  test "should update contas_pagar" do
    patch contas_pagar_url(@contas_pagar), params: { contas_pagar: { data_pagamento: @contas_pagar.data_pagamento, descricao: @contas_pagar.descricao, pago: @contas_pagar.pago, valor: @contas_pagar.valor } }
    assert_redirected_to contas_pagar_url(@contas_pagar)
  end

  test "should destroy contas_pagar" do
    assert_difference('ContasPagar.count', -1) do
      delete contas_pagar_url(@contas_pagar)
    end

    assert_redirected_to contas_pagars_url
  end
end
