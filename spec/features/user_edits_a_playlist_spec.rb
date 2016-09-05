require 'rails_helper'

RSpec.feature "user edits a playlist" do
  scenario "visits show page to edit and sees updates" do
    playlist_1 = create(:playlist_with_songs)
    song_1, song_2, song_3 = playlist_1.songs
    new_song = create(:song, title: "New Song")

    visit playlist_path(playlist_1)
    click_on "Edit"
    fill_in "playlist_name", with: "New Playlist Name"
    check("song-#{new_song.id}")
    check("song-#{song_2.id}")
    uncheck("song-#{song_1.id}")
    click_on "Update Playlist"

    expect(page).to have_content "New Playlist Name"
    expect(page).to have_content "#{song_2.title}"
    expect(page).to have_content "#{new_song.title}"
    expect(page).to_not have_content "#{song_1.title}"
  end
end
