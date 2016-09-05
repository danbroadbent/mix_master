require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "it has vaild attributes" do
      it "creates a new playlist" do
        expect{
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns new playlist to @playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to new playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end

    context "with invalid attributes" do
      it "assigns a new unsaved playlist to @playlist" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the new template" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates a playlist" do
        playlist = create(:playlist)
        patch :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "new playlist")}
        playlist.reload
        expect(playlist.name).to eq("new playlist")
      end

      it "assigns the requested playlist to @playlist" do
        playlist = create(:playlist)
        patch :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "new playlist")}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the updated playlist" do
        playlist = create(:playlist)
        patch :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "new playlist")}
        expect(response).to redirect_to(playlist)
      end
    end

    context "with invaild attrubutes" do
      it "assigns requested playlist to @playlist" do
        playlist = create(:playlist)
        patch :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "re-renders edit template" do
        playlist = create(:playlist)
        patch :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end
end
