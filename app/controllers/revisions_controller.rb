class RevisionsController < ApplicationController
  def index
    @revisions = Revision.all

    @revision_title_results = Revision.where("title iLIKE ?", "%#{params[:search]}%")
    @revision_content_results = Revision.where("content iLIKE ?", "%#{params[:search]}%")
  end

  def show
    @revision = Revision.find params[:id]
    @note = @revision.note
  end

  private
    def revisions_params
      params.require(:revision).permit(:title, :content, :classification_id, :note_id)
    end
  end
