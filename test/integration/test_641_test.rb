require "test_helper"

class Test641Test < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:one)
    @one = accounts :one
    @two = accounts :two
  end

  test 'account index' do

      visit paginicio_index_path

      assert (!page.has_content?("John"))

      click_link('Dar de Alta')
      fill_in('Name', with: 'John')
      fill_in('Dni', with: '000000000')
      fill_in('Password', with: 'John')
      fill_in('Nomina', with: 'John')
      fill_in('Amount', with: 'John')
      click_on('Create Account')

      visit paginicio_index_path

      assert page.has_content?("John")
      assert page.has_content?("MyString")
      assert page.has_content?("MyString2")

  end

end
