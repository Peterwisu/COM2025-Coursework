class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /playlists or /playlists.json
  def index
    
    
    @playlists= Playlist.user_playlists(current_user)

  end

  # GET /playlists/1 or /playlists/1.json
  def show
    @songs = Song.all
    
      
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: "You have create a playlist: "+ @playlist.name }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: "You have edit platlist: "+ @playlist.name }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "You have delete a playlist: "+ @playlist.name }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name, :created_by)
    end
end