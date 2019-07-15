
module Api
 
  module V1

class ClassicationsController < ApplicationController
  before_action :set_classication, only: [:show, :edit, :update, :destroy]

  # GET /classications
  # GET /classications.json
  def index
  
    @classications = Classication.all

    
  end

  # GET /classications/1
  # GET /classications/1.json
  def show
    @classication = Classication.find(params[:id])
    @movies = @classication.movies

    respond_to do |format|
      format.html
      format.json {render :json => @classication}
    end
  end

  # GET /classications/new
  def new
    @movies = Movie.all
    @classication = Classication.new
  end

  # GET /classications/1/edit
  def edit
  end

  # POST /classications
  # POST /classications.json
  def create
    @classication = Classication.new(classication_params)

    respond_to do |format|
      if @classication.save
        format.html { redirect_to @classication, notice: 'Classication was successfully created.' }
        format.json { render :show, status: :created, location: @classication }
      else
        format.html { render :new }
        format.json { render json: @classication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classications/1
  # PATCH/PUT /classications/1.json
  def update
    respond_to do |format|
      if @classication.update(classication_params)
        format.html { redirect_to @classication, notice: 'Classication was successfully updated.' }
        format.json { render :show, status: :ok, location: @classication }
      else
        format.html { render :edit }
        format.json { render json: @classication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classications/1
  # DELETE /classications/1.json
  def destroy
    @classication.destroy
    respond_to do |format|
      format.html { redirect_to classications_url, notice: 'Classication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classication
      @classication = Classication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classication_params
      params.require(:classication).permit(:number, :category)
    end
end
end
end