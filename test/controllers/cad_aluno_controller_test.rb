require 'test_helper'

class CadAlunoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cad_aluno_new_url
    assert_response :success
  end

end
