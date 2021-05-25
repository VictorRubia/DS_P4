module Api
module V1
  class AccountsController < ApplicationController

skip_before_action :verify_authenticity_token

def show
  @account = Account.find_by(id: params[:id])
      if (@account!=nil)
        render json: @account, status: :ok, :include => [:cards, :loans, :requests, :transfers, :investments, :transactions]
  else
       render json: :nothing, status: :not_found
    end
end

def index
        render json: Account.all, status: :ok, :include => [:cards, :loans, :requests, :transfers, :investments, :transactions]
end

def update
  @account = Account.find(params[:id])

  if @account.update(account_params)
        render json: @account, status: :ok
      else
        render json: @account.errors, status: :unprocessable_entity
      end
end

def create
  @account = Account.new(account_params)

      if @account.save
        render json: @account, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
end

def destroy
  @account = Account.find(params[:id])
    if @account.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
end
private
def account_params
    params.require(:account).permit(:name, :dni, :password, :amount, :iban, :nomina)
end
end
end
end

