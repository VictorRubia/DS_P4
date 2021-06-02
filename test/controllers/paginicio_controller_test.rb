require "test_helper"

class PaginicioControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get paginicio_new_url
    assert_response :success
  end

  test "should get create" do
    get paginicio_create_url
    assert_response :success
  end
end
