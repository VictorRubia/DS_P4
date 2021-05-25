
module Api
  module V1
    class LoansController < ApplicationController

      skip_before_action :verify_authenticity_token

      def show
        @loan = Loan.find_by(id: params[:id])
        if (@loan!=nil)
          render json: @loan, status: :ok
        else
          render json: :nothing, status: :not_found
        end
      end

      def index
        render json: Loan.all, status: :ok
      end

      def update
        @loan = Loan.find(params[:id])

        if @loan.update(account_params)
          render json: @loan, status: :ok
        else
          render json: @loan.errors, status: :unprocessable_entity
        end
      end

      def create
        @loan = Loan.new(account_params)

        if @loan.save
          render json: @loan, status: :created
        else
          render json: @loan.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @loan = Loan.find(params[:id])
        if @loan.destroy
          render json: :nothing, status: :ok
        else
          render json: :nothing, status: :unprocessable_entity
        end
      end
      private
      def account_params
        params.require(:loan).permit(:amount, :meses, :interes, :account_id, :concepto)
      end
    end
  end
end

