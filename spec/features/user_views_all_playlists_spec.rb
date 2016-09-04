require 'rails_helper'

RSpec.feature "view all playlists" do
  scenario "user sees the page for all playlists" do
    playlist_1 = create(:playlist_with_songs)

    visit playlists_path
    expect(page).to have_content playlist_1.name
    expect(page).to have_link playlist_1.name, href: playlist_path(playlist_1)
  end
end
