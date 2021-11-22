require "application_system_test_case"

class ListSongsTest < ApplicationSystemTestCase
  setup do
    @list_song = list_songs(:one)
  end

  test "visiting the index" do
    visit list_songs_url
    assert_selector "h1", text: "List Songs"
  end

  test "creating a List song" do
    visit list_songs_url
    click_on "New List Song"

    fill_in "Playlist", with: @list_song.playlist_id
    fill_in "Song", with: @list_song.song_id
    click_on "Create List song"

    assert_text "List song was successfully created"
    click_on "Back"
  end

  test "updating a List song" do
    visit list_songs_url
    click_on "Edit", match: :first

    fill_in "Playlist", with: @list_song.playlist_id
    fill_in "Song", with: @list_song.song_id
    click_on "Update List song"

    assert_text "List song was successfully updated"
    click_on "Back"
  end

  test "destroying a List song" do
    visit list_songs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "List song was successfully destroyed"
  end
end
