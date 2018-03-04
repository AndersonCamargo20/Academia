require 'test_helper'

class ContasRecebersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contas_receber = contas_recebers(:one)
  end

  test "should get index" do
    get contas_recebers_url
    assert_response :success
  end

  test "should get new" do
    get new_contas_receber_url
    assert_response :success
  end

  test "should create contas_receber" do
    assert_difference('ContasReceber.count') do
      post contas_recebers_url, params: { contas_receber: { aluno_id: @contas_receber.aluno_id, data_recebimento: @contas_receber.data_recebimento, pago: @contas_receber.pago } }
    end

    assert_redirected_to contas_receber_url(ContasReceber.last)
  end

  test "should show contas_receber" do
    get contas_receber_url(@contas_receber)
    assert_response :success
  end

  test "should get edit" do
    get edit_contas_receber_url(@contas_receber)
    assert_response :success
  end

  test "should update contas_receber" do
    patch contas_receber_url(@contas_receber), params: { contas_receber: { aluno_id: @contas_receber.aluno_id, data_recebimento: @contas_receber.data_recebimento, pago: @contas_receber.pago } }
    assert_redirected_to contas_receber_url(@contas_receber)
  end

  test "should destroy contas_receber" do
    assert_difference('ContasReceber.count', -1) do
      delete contas_receber_url(@contas_receber)
    end

    assert_redirected_to contas_recebers_url
  end
end
