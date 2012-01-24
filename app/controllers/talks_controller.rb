class TalksController < ApplicationController

  # GET /talks/1
  # GET /talks/1.json
  def show
    @meeting = Meeting.find(params[:meeting_id])
    @talk = @meeting.talks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @talk }
    end
  end

  # GET /talks/1/edit
  def edit
    @meeting = Meeting.find(params[:meeting_id])
    @talk = @meeting.talks.find(params[:id])
  end

  # POST /talks
  # POST /talks.json
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @talk = @meeting.talks.new(params[:talk])

    respond_to do |format|
      if @talk.save
        format.html { redirect_to meeting_talk_url(@meeting,@talk), notice: 'Talk was successfully created.' }
        format.json { render json: @talk, status: :created, location: meeting_talk_url(@meeting,@talk) }
      else
        format.html { render action: "new" }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /talks/1
  # PUT /talks/1.json
  def update
    @meeting = Meeting.find(params[:meeting_id])
    @talk = @meeting.talks.find(params[:id])

    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        format.html { redirect_to meeting_talk_url(@meeting,@talk), notice: 'Talk was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @meeting = Meeting.find(params[:meeting_id])
    @talk = @meeting.talks.find(params[:id])
    @talk.destroy

    respond_to do |format|
      format.html { redirect_to meeting_talks_url(@meeting) }
      format.json { head :ok }
    end
  end
end
