class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]
  before_action :set_artist, only: [:new, :create]
  before_action :authenticate_user!
  # GET /songs or /songs.json
  def index
    
    @songs = Song.user_songs(current_user)
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = @artist.songs.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs or /songs.json
  def create
    @song = @artist.songs.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to artist_path(@song.artist), notice: "You have added a song: "+@song.name + ' from ' + @song.artist.name}
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: "You have updated song "+ @song.name }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: "You have deleted song: "+@song.name }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end
    def set_artist
      @artist = Artist.find_by(id: params[:artist_id]) ||Artist.find(song_params[:artist_id])
    end
    

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:artist_id, :name, :album, :duration)
    end
end
