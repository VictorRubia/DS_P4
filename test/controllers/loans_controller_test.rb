require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "Cuando gestionamos un prestamo este debe borrarese de prestamos pendientes y añadirse en los movimientos" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { account_id: @loan.account_id, amount: @loan.amount } }
    end
    assert_redirected_to transaction_url(Transaction.last)
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
