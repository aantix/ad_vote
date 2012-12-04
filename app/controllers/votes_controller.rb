class VotesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new]

  def new
    raise "Must supply a study sample id" if params[:study_sample_id].nil?

    @suppress_navigation = true

    @study_sample   = StudySample.find(params[:study_sample_id])
    @study          = @study_sample.study
    @user_ad        = @study_sample.ad

    @ads            = @study.display_ads.all
    @study.insert_user_ad(@ads, @user_ad)

    @search_results = @study.display_search_results

    @vote           = Vote.new
    @disabled       = Turkee::TurkeeFormHelper::disable_form_fields?(params)
  end
end
