class PeopleController < ApplicationController

  # GET /people or /people.json
  def index
    @people = People.all
  end

  # GET /people/1 or /people/1.json
  def show
    @people = People.find(params[:id])
  end

  # GET /people/new
  def new
    @People = People.new
  end

  # POST /people or /people.json
  def create
    @People = People.new(People_params)

    respond_to do |format|
      if @People.save
        format.html { redirect_to People_url(@People), notice: "People was successfully created." }
        format.json { render :show, status: :created, location: @People }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @People.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @People.update(People_params)
        format.html { redirect_to People_url(@People), notice: "People was successfully updated." }
        format.json { render :show, status: :ok, location: @People }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @People.errors, status: :unprocessable_entity }
      end
    end
  end
end
