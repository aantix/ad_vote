class AdsController < ApplicationController
  def show
    @ad = current_user.ads.find(params[:id])
  end
end