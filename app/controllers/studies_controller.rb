class StudiesController < ApplicationController
  # GET /studies
  # GET /studies.json
  def index
    @studies = Study.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studies }
    end
  end

  # GET /studies/1
  # GET /studies/1.json
  def show
    @study = Study.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study }
    end
  end

  # GET /studies/new
  # GET /studies/new.json
  def new
    @study = Study.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @study }
    end
  end

  # GET /studies/1/edit
  def edit
    @study = Study.find(params[:id])
  end

  # POST /studies
  # POST /studies.json
  def create
    @study = Study.new(params[:study])

    respond_to do |format|
      if @study.save
        format.html { redirect_to @study, notice: 'Study was successfully created.' }
        format.json { render json: @study, status: :created, location: @study }
      else
        format.html { render action: "new" }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /studies/1
  # PUT /studies/1.json
  def update
    @study = Study.find(params[:id])

    respond_to do |format|
      if @study.update_attributes(params[:study])
        format.html { redirect_to @study, notice: 'Study was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studies/1
  # DELETE /studies/1.json
  def destroy
    @study = Study.find(params[:id])
    @study.destroy

    respond_to do |format|
      format.html { redirect_to studies_url }
      format.json { head :no_content }
    end
  end
end
