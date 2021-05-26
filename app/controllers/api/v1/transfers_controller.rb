
module Api
  module V1
    class TransfersController < ApplicationController

      skip_before_action :verify_authenticity_token

      def show
        @transfer = Transfer.find_by(id: params[:id])
        if (@transfer!=nil)
          render json: @transfer, status: :ok
        else
          render json: :nothing, status: :not_found
        end
      end

      def index
        render json: Transfer.all, status: :ok
      end

      def update
        @transfer = Transfer.find(params[:id])

        if @transfer.update(account_params)
          render json: @transfer, status: :ok
        else
          render json: @transfer.errors, status: :unprocessable_entity
        end
      end

      def create
        @transfer = Transfer.new(account_params)

        if @transfer.save
          render json: @transfer, status: :created
        else
          render json: @transfer.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @transfer = Transfer.find(params[:id])
        if @transfer.destroy
          render json: :nothing, status: :ok
        else
          render json: :nothing, status: :unprocessable_entity
        end
      end
      private
      def account_params
        params.require(:transfer).permit(:amount, :account_id, :account2_id, :concepto)
      end
    end
  end
end

