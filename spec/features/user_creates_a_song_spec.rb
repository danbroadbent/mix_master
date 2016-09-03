require 'rails_helper'

RSpec.feature "User creates a song" do
  scenario "they see the song page" do
    artist = create(:artist)
    song_title = "One Love"

    visit artist_path(artist)
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"
    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  scenario "validates song title is entered" do
    artist = create(:artist)

    visit artist_path(artist)
    click_on "New Song"
    click_on "Create Song"
    expect(page).to have_content "Title can't be blank"
  end

  # scenario "can edit a song" do
  #   artist = create(:artist)
  #   song = create(:song)
  #
  #   visit song_path(song)
  #   click_on "Edit"
  #   fill_in "song_title", with: song.title
  #   click_on "Update Song"
  #   expect(page).to have_content "#{song.title}"
  #   expect(page).to have_link 'Artist', href: 'artist_path(artist)'
  # end
end
