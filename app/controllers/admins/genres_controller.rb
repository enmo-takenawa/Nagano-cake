class Admins::GenresController < ApplicationController
    
    def index
        @genres = Genre.all
        @genre = Genre.new
    end
    
    def new
    end
    
    def create
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        @genre.update
        redirect_to admins_genres_path
    end
end
