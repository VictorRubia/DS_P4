module Api
  module V1
    class LoginController < ApplicationController

      skip_before_action :verify_authenticity_token

      def show
        @project = Account.find_by(id: params[:id])
        if (@project!=nil)
          render json: @project, status: :ok, :only => [:id, :dni, :password]
        else
          render json: :nothing, status: :not_found
        end
      end

      def index
        render json: Account.all, status: :ok, :only => [:id, :dni, :password]
      end

      private
      def project_params
        params.require(:project).permit(:name, :team, :info)
      end
    end
  end
end

