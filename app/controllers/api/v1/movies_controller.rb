  module Api
  
  module V1

class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json##
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
   # @movie = Movie.find([params[:id])
  end

  # GET /movies/new
  def new
  
   @movie= Movie.new
    #@classications = Classication.find(params[:id])
    @movie = Movie.include(:classication =>[:movies]).find(params[:id])
    @classication =@movie.classication.build(&:id)
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @classication = Classication.find(params[:id]) 
    @movie = @classication.movies.create(movie_params)
     if @movie.save
      #redirect_to new_movie_path(:id => @classication.id)
      flash[:success] ="movie created!"
      redirect_to new_movie_path(:id =>@classcation.id)
    else
      render :new
    end
  end


  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :year, :director, :category, :classication_id)
    end
end
end
end