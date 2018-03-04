require 'test_helper'

class ExameFisicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exame_fisico = exame_fisicos(:one)
  end

  test "should get index" do
    get exame_fisicos_url
    assert_response :success
  end

  test "should get new" do
    get new_exame_fisico_url
    assert_response :success
  end

  test "should create exame_fisico" do
    assert_difference('ExameFisico.count') do
      post exame_fisicos_url, params: { exame_fisico: { altura: @exame_fisico.altura, altura: @exame_fisico.altura, aluno_id: @exame_fisico.aluno_id, busto: @exame_fisico.busto, cintura: @exame_fisico.cintura, dataExame: @exame_fisico.dataExame, funcionario_id: @exame_fisico.funcionario_id, imc: @exame_fisico.imc, peso: @exame_fisico.peso } }
    end

    assert_redirected_to exame_fisico_url(ExameFisico.last)
  end

  test "should show exame_fisico" do
    get exame_fisico_url(@exame_fisico)
    assert_response :success
  end

  test "should get edit" do
    get edit_exame_fisico_url(@exame_fisico)
    assert_response :success
  end

  test "should update exame_fisico" do
    patch exame_fisico_url(@exame_fisico), params: { exame_fisico: { altura: @exame_fisico.altura, altura: @exame_fisico.altura, aluno_id: @exame_fisico.aluno_id, busto: @exame_fisico.busto, cintura: @exame_fisico.cintura, dataExame: @exame_fisico.dataExame, funcionario_id: @exame_fisico.funcionario_id, imc: @exame_fisico.imc, peso: @exame_fisico.peso } }
    assert_redirected_to exame_fisico_url(@exame_fisico)
  end

  test "should destroy exame_fisico" do
    assert_difference('ExameFisico.count', -1) do
      delete exame_fisico_url(@exame_fisico)
    end

    assert_redirected_to exame_fisicos_url
  end
end
