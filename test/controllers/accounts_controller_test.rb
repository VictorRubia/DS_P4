require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest

  test "the truth" do
    assert true
  end

  # setup do
  #   @account = accounts(:one)
  # end
  #
  # test "Cuando damos de alta un cliente este se inserta" do
  #   assert_difference('Account.count') do
  #     post accounts_url, params: { account: { amount: @account.amount, dni: @account.dni, iban: @account.iban, name: @account.name, nomina: @account.nomina, password: @account.password } }
  #   end
  #
  #   assert_redirected_to account_url(Account.last)
  # end
  #
  # test "Cuando se da de baja un cliente este se borra" do
  #   assert_difference('Account.count', -1) do
  #     delete account_url(@account)
  #   end
  #
  #   assert_redirected_to accounts_url
  # end
end
