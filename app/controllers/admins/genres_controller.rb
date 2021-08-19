class Admins::GenresController < ApplicationController
    
    def index
        @genres = Genre.all
        @genre = Genre.new
    end
    
    def new
    end
    
    def create
        @genre = Genre.new(genre_params)
        @genre.save
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        redirect_to admins_genres_path
    end
    
privete
    def genre_params
        params.require(:genre).permit(:name)
    end
end
