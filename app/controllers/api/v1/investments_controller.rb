module Api
  module V1
    class InvestmentsController < ApplicationController

      skip_before_action :verify_authenticity_token

      def show
        @investment = Investment.find_by(id: params[:id])
        if (@investment!=nil)
          render json: @investment, status: :ok
        else
          render json: :nothing, status: :not_found
        end
      end

      def index
        render json: Investment.all, status: :ok
      end

      def update
        @investment = Investment.find(params[:id])

        if @investment.update(account_params)
          render json: @investment, status: :ok
        else
          render json: @investment.errors, status: :unprocessable_entity
        end
      end

      def create
        @investment = Investment.new(account_params)

        if @investment.save
          render json: @investment, status: :created
        else
          render json: @investment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @investment = Investment.find(params[:id])
        if @investment.destroy
          render json: :nothing, status: :ok
        else
          render json: :nothing, status: :unprocessable_entity
        end
      end
      private
      def account_params
        params.require(:investment).permit(:amount, :meses, :interes, :account_id, :concepto)
      end
    end
  end
end

