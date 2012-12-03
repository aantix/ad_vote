class VotesController < ApplicationController
  def new
    raise "Must supply a study id" if params[:study_id].nil?
    raise "Must supply an ad id" if params[:ad_id].nil?

    @suppress_navigation = true

    @study    = Study.find(params[:study_id])
    @user_ad  = Ad.find(params[:ad_id])
    @study.insert_user_ad(@user_ad)

    @vote     = Vote.new
    @disabled = Turkee::TurkeeFormHelper::disable_form_fields?(params)
  end
end
