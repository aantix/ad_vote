class StudiesController < ApplicationController
  def index
    @studies = current_user.studies
  end

  def show
    @study = current_user.studies.find(params[:id])
  end

  def new
    @study = current_user.studies.new
  end

  def edit
    @study = current_user.studies.find(params[:id])
  end

  def create
    @study = current_user.studies.new(params[:study])

    if @study.save
      @study.import_competing_ads
      @study.import_ad_file
      @study.import_search_results
      @study.create_turk_tasks

      redirect_to @study, notice: 'Study was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @study = current_user.studies.find(params[:id])

    if @study.update_attributes(params[:study])
      redirect_to @study, notice: 'Study was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @study = current_user.studies.find(params[:id])
    @study.destroy

    redirect_to studies_url
  end
end
