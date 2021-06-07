class PaginicioController < ApplicationController
  def new
  end

  def create
  end

  def download_apk
    send_file("#{Rails.root}/app-release.apk")
  end
end
