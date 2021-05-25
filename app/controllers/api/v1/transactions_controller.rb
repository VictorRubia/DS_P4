module Api
  module V1
    class TransactionsController < ApplicationController

      skip_before_action :verify_authenticity_token

      def show
        @transaction = Transaction.find_by(id: params[:id])
        if (@transaction!=nil)
          render json: @transaction, status: :ok
        else
          render json: :nothing, status: :not_found
        end
      end

      def index
        render json: Transaction.all, status: :ok
      end

      def update
        @transaction = Transaction.find(params[:id])

        if @transaction.update(account_params)
          render json: @transaction, status: :ok
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end

      def create
        @transaction = Transaction.new(account_params)

        if @transaction.save
          render json: @transaction, status: :created
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @transaction = Transaction.find(params[:id])
        if @transaction.destroy
          render json: :nothing, status: :ok
        else
          render json: :nothing, status: :unprocessable_entity
        end
      end
      private
      def account_params
        params.require(:transaction).permit(:amount, :account_id)
      end
    end
  end
end

