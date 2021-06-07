require "test_helper"

class AccountTest < ActiveSupport::TestCase

  test "Si damos de baja un cliente este se ausencia en la lista de clientes" do
    account = Account.new
    account.delete
    !assert_includes @accounts, account, "El cliente no esta en la lista"
  end

  test "Si anulamos una tarjeta esta se ausencia en la lista de tarjetas" do
    card = Card.new
    card.delete
    !assert_includes @cards, card, "La tarjeta no esta en la lista"
  end

  test "Los datos del modelo identifican correctamente al empleado" do

  end

end
