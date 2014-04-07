class MoviesController < ApplicationController
  before_action :find_movie, only: [:update, :edit, :show, :delete]

    def index
      @movies = Movie.all
      
    end

    def new
      @movie = Movie.new 
    end

    def create
      safe_movie = params.require(:movie).permit(:title, :description, :year_released)
      @movie = Movie.new(safe_movie)
      if @movie.save
      redirect_to @movie
      else
      render 'new'
      end
    end


    def search
      query = params[:q]                                                             
      @movies = Movie.search_for(query)
    end
     
    def show
      @movie = Movie.find(params[:id])
    end

    
    def update
      safe_movie = params.require(:movie).permit(:title, :description, :year_released)
      if @movie.update(safe_movie)
      redirect_to @movie
      else
      render 'edit' 
      end
      

    end

    def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
 
    redirect_to index_path
end
      
  

    private

    def safe_movie_params
      params.require(:movie).permit(:title, :descrption, :year_released)
    end 

    def find_movie
      @movie = Movie.find(params[:id])
    end

end
