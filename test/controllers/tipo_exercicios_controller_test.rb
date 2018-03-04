require 'test_helper'

class TipoExerciciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_exercicio = tipo_exercicios(:one)
  end

  test "should get index" do
    get tipo_exercicios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_exercicio_url
    assert_response :success
  end

  test "should create tipo_exercicio" do
    assert_difference('TipoExercicio.count') do
      post tipo_exercicios_url, params: { tipo_exercicio: { descricaoExercicio: @tipo_exercicio.descricaoExercicio } }
    end

    assert_redirected_to tipo_exercicio_url(TipoExercicio.last)
  end

  test "should show tipo_exercicio" do
    get tipo_exercicio_url(@tipo_exercicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_exercicio_url(@tipo_exercicio)
    assert_response :success
  end

  test "should update tipo_exercicio" do
    patch tipo_exercicio_url(@tipo_exercicio), params: { tipo_exercicio: { descricaoExercicio: @tipo_exercicio.descricaoExercicio } }
    assert_redirected_to tipo_exercicio_url(@tipo_exercicio)
  end

  test "should destroy tipo_exercicio" do
    assert_difference('TipoExercicio.count', -1) do
      delete tipo_exercicio_url(@tipo_exercicio)
    end

    assert_redirected_to tipo_exercicios_url
  end
end
