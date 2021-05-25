
module Api
  module V1
    class RequestsController < ApplicationController

      skip_before_action :verify_authenticity_token

      def show
        @request = Request.find_by(id: params[:id])
        if (@request!=nil)
          render json: @request, status: :ok
        else
          render json: :nothing, status: :not_found
        end
      end

      def index
        render json: Request.all, status: :ok
      end

      def update
        @request = Request.find(params[:id])

        if @request.update(account_params)
          render json: @request, status: :ok
        else
          render json: @request.errors, status: :unprocessable_entity
        end
      end

      def create
        @request = Request.new(account_params)

        if @request.save
          render json: @request, status: :created
        else
          render json: @request.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @request = Request.find(params[:id])
        if @request.destroy
          render json: :nothing, status: :ok
        else
          render json: :nothing, status: :unprocessable_entity
        end
      end
      private
      def account_params
        params.require(:request).permit(:id_objetivo, :account_id, :tipo, :solved)
      end
    end
  end
end

