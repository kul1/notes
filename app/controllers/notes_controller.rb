class NotesController < ApplicationController
  before_action :load_note, only: [:show, :destroy]
  before_action :xload_current_ma_user, only: [:destroy]

  def index
    @notes = Note.desc(:created_at).page(params[:page]).per(10)
  end

  def my
    @notes = Note.where(user_id: current_ma_user).desc(:created_at).page(params[:page]).per(10)
    @page_title       = 'My Notes'
  end

  def show 
  end

  def edit
    @note = Note.find(params[:id])
    @page_title       = 'Edit Note'
  end

  def create
    @note = Note.new(
      title: $xvars["new_note"]["title"],
      body: $xvars["new_note"]["body"],
      user_id: $xvars["user_id"])
    @note.save!
    # if @note.save!
    #   format.html { redirect_to @note, notice: 'Sample was successfully created.'  }
    #   format.json { render :show, status: :created, location: @note }
    # else
    #   format.html { render :new }
    #   format.json { render json: @note.errors, status: :unprocessable_entity }
    # end
    redirect_to @note

  end


  def update
    # $xvars["select_note"] and $xvars["edit_note"]
    # These are variables.
    # They contain everything that we get their forms select_note and edit_note
    note_id = $xvars["select_note"] ? $xvars["select_note"]["id"] : $xvars["p"]["note_id"]
    @note = Note.find(note_id)
    @note.update(title: $xvars["edit_note"]["title"],
                 body: $xvars["edit_note"]["body"])
    redirect_to @note

  end

  def destroy
    xload_current_ma_user
    if @current_ma_user.role.upcase.split(',').include?("A") || @current_ma_user == @note.user
      @note.destroy
    end
    redirect_to :action=>'index'
  end

  def mail
    NoteMailer.gmail(
                    $xvars["display_mail"]["body"],
                    $xvars["select_note"]["email"],
                    $xvars["select_note"]["title"],
                    xload_current_ma_user.email)
  end

  private

  # Tobe called from other controller:jinda
  def xload_current_ma_user
    @current_ma_user = User.find($xvars["user_id"])
  end

  # Tobe called from other controller:jinda
  def load_note
    @note = Note.find(params[:id])
  end

end
