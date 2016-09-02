require 'rails_helper'

RSpec.feature "User submits a new artist" do
  scenario "they see the page for individual artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit 'artists'
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

      visit artists_path
      click_on "New Artist"
      fill_in "artist_image_path", with: artist_image_path
      click_on "Create Artist"

      expect(page).to have_content "Name can't be blank"
    end
  end

  scenario "User views all artists" do
    artist_1 = Artist.create(name: "Michael Jackson", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist_2 = Artist.create(name: "Madonna", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artists_path

    expect(page).to have_content "Michael Jackson"
    expect(page).to have_content "Madonna"
    expect(page).to have_link "Michael Jackson"
    expect(page).to have_link "Madonna"
  end

  scenario "User edits an artist" do
    artist_1 = Artist.create(name: "Michael Jackson", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist_1.id)

    click_on "Edit"
    fill_in "artist_name", with: "Green Day"
    click_on "Update Artist"

    expect(page).to have_content "Green Day"
    expect(page).to have_css('img')
  end
end
