class NotesController < ApplicationController
  def index
    @notes = Note.all

    @revisions = Revision.all

    @note_title_results = Note.where("title iLIKE ?", "%#{params[:search]}%")
    @note_content_results = Note.where("content iLIKE ?", "%#{params[:search]}%")
  end

  def create
    @note = Note.new note_params
    @note.user << @current_user
    @note.creator = @current_user
    @note.save

    flash[:notice] = "New note posted."
    redirect_to @note
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find params[:id]
    @revision = Revision.new
  end

  def show
    @note = Note.find params[:id]
    @users = User.all
  end

  def update
    note = Note.find params[:id]
    
    revision = Revision.new(note.attributes.slice('title', 'content', 'classification_id'))
    revision.note_id = note.id
    revision.user_id = @current_user.id
    note.revisions << revision

    if note.update note_params
      flash[:notice] = 'Note is updated.'
      redirect_to note
    else
      render :edit
    end
  end

  def destroy
    note = Note.find params[:id]
    note.destroy

    note.revisions.each do |revision|
      revision.destroy
    end

    redirect_to notes_path
  end

private
  def note_params
    params.require(:note).permit(:title, :classification_id, :content)
  end

  def revision_params
    params.require(:revision).permit(:title, :content, :classification_id, :note_id)
  end
end

