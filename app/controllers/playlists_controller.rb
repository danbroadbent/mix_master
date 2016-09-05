class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]
  before_action :set_songs, only: [:new, :edit]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def show
  end

  def edit
  end

  def update
    @playlist.update(playlist_params)
    redirect_to @playlist
  end

  private

  def set_songs
    @songs = Song.all
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, song_ids:[])
  end
end
