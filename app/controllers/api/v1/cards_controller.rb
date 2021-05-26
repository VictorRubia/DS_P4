module Api
  module V1
    class CardsController < ApplicationController

      skip_before_action :verify_authenticity_token

      def show
        @card = Card.find_by(id: params[:id])
        if (@card!=nil)
          render json: @card, status: :ok
        else
          render json: :nothing, status: :not_found
        end
      end

      def index
        render json: Card.all, status: :ok
      end

      def update
        @card = Card.find(params[:id])

        if @card.update(account_params)
          render json: @card, status: :ok
        else
          render json: @card.errors, status: :unprocessable_entity
        end
      end

      def create
        @card = Card.new(account_params)

        if @card.save
          render json: @card, status: :created
        else
          render json: @card.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @card = Card.find(params[:id])
        if @card.destroy
          render json: :nothing, status: :ok
        else
          render json: :nothing, status: :unprocessable_entity
        end
      end
      private
      def account_params
        params.require(:card).permit(:amount, :meses, :interes, :account_id, :concepto)
      end
    end
  end
end

