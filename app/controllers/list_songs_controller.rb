class ListSongsController < ApplicationController
  before_action :set_list_song, only: %i[ show edit update destroy ]
  before_action :set_song , only: [:new, :create]
  before_action :authenticate_user!
   # # # # # # # # # # # # # # # #
  # GET /list_songs or /list_songs.json
  def index
    
    @list_songs = ListSong.user_list_songs(current_user)
 end
 # # # # # # # # # # # #
  # GET /list_songs/1 or /list_songs/1.json
  def show
  end

  # GET /list_songs/new
  def new
    @list_song = @song.list_song.new
  end


   # # # # # # # # # # # # # # # # # #
  # GET /list_songs/1/edit
  def edit
  end

  # POST /list_songs or /list_songs.json
  def create
    @list_song = @song.list_song.new(list_song_params)

    respond_to do |format|
      if @list_song.save
        format.html { redirect_to playlist_path(@list_song.playlist_id), notice: "You have added a song:"+ @list_song.song.name + ' to a playlist: '+@list_song.playlist.name }
        format.json { render :show, status: :created, location: @list_song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_songs/1 or /list_songs/1.json
  def update
    respond_to do |format|
      if @list_song.update(list_song_params)
        format.html { redirect_to @list_song, notice: "List song was successfully updated." }
        format.json { render :show, status: :ok, location: @list_song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_songs/1 or /list_songs/1.json
  def destroy
    @list_song.destroy
    respond_to do |format|
      format.html { redirect_to playlist_path(@list_song.playlist_id), notice: "You have removed a song:"+ @list_song.song.name + ' from a playlist: '+@list_song.playlist.name }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_song
      @list_song = ListSong.find(params[:id])
    end

    def set_song
      @song = Song.find_by(id: params[:song_id])||Song.find(list_song_params[:song_id])
    end

    # Only allow a list of trusted parameters through.
    def list_song_params
      params.require(:list_song).permit(:playlist_id, :song_id)
    end
end
