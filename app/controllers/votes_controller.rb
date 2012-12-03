class VotesController < ApplicationController
  def new
    raise "Must supply a study id" if params[:study_id].nil?

    @study    = Study.find(params[:study_id])
    @vote     = Vote.new
    @disabled = Turkee::TurkeeFormHelper::disable_form_fields?(params)
  end
end
