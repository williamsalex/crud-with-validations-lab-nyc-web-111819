require 'pry'
class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    def show
        @song = Song.find(params['id'])
    end
    def new
        @song = Song.new
    end
    def create
        @song = Song.new(song_params)
        if @song.valid? == true
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end
    def edit
        @song = Song.find(params['id'])
    end
    def update
        if Song.update(song_params['id'], song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end
    def destroy
        @song = Song.find(params['id'])
        @song.destroy
        redirect_to '/songs/'
    end

    private
    def song_params
        params.require(:song).permit(:title,:release_year,:released,:genre,:artist_name)
    end