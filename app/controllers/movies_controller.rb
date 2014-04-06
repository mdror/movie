class MoviesController < ApplicationController
  before_action :find_movie, only: [:update, :edit, :show]

    def index
    
        @movies = Movie.all

    end

    def new
         @movie = Movie.new 
    end


    def search
     query = params[:q]                                                             
     @movies = Movie.search_for query 
    end
     

    def show
        @movie = Movie.find(params[:id])
    
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



    def update
      safe_movie = params.require(:movie).permit(:title, :description, :year_released)
      if @movie.update(safe_movie)
      redirect_to @movie
      else
      render 'edit'
      end
   end

    def update
         @movie.update safe_movie_params
         redirect_to @movie 
    end

    private

    def safe_movie_params
         params.require('movie').permit(:title, :descrption)
    end 

     

    def find_movie
          @movie = Movie.find(params[:id])
    end

end
