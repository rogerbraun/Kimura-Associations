class KimuraEntriesController < ApplicationController
  # GET /kimura_entries
  # GET /kimura_entries.xml
  def index
    if user_signed_in? then
      @kimura_entries = current_user.kimura_entries.paginate :page => params[:page], :order => 'created_at ASC'
    else
      @kimura_entries = KimuraEntry.paginate :page => params[:page], :order => 'created_at ASC'
    end
    
    session[:back_to_index] = params[:page] || 1
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kimura_entries }
    end
  end

  # GET /kimura_entries/1
  # GET /kimura_entries/1.xml
  def show
    @kimura_entry = KimuraEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kimura_entry }
    end
  end

  # GET /kimura_entries/new
  # GET /kimura_entries/new.xml
  def new
    @kimura_entry = KimuraEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kimura_entry }
    end
  end

  # GET /kimura_entries/1/edit
  def edit
    session[:back_to] = request.env["HTTP_REFERER"]
    @kimura_entry = KimuraEntry.find(params[:id])
  end

  # POST /kimura_entries
  # POST /kimura_entries.xml
  def create
    @kimura_entry = KimuraEntry.new(params[:kimura_entry])

    respond_to do |format|
      if @kimura_entry.save
        format.html { redirect_to(@kimura_entry, :notice => 'Kimura entry was successfully created.') }
        format.xml  { render :xml => @kimura_entry, :status => :created, :location => @kimura_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kimura_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kimura_entries/1
  # PUT /kimura_entries/1.xml
  def update
    @kimura_entry = KimuraEntry.find(params[:id])

    respond_to do |format|
      if @kimura_entry.update_attributes(params[:kimura_entry])
        format.html { redirect_to(session[:back_to] || @kimura_entry, :notice => 'Kimura entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kimura_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kimura_entries/1
  # DELETE /kimura_entries/1.xml
  def destroy
    @kimura_entry = KimuraEntry.find(params[:id])
    @kimura_entry.destroy

    respond_to do |format|
      format.html { redirect_to(kimura_entries_url) }
      format.xml  { head :ok }
    end
  end
end
