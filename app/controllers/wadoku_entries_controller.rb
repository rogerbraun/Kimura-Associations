class WadokuEntriesController < ApplicationController
  # GET /wadoku_entries
  # GET /wadoku_entries.xml
  def index

    @wadoku_entries = WadokuEntry.paginate :page => params[:page], :order => 'created_at ASC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wadoku_entries }
    end
  end

  # GET /wadoku_entries/1
  # GET /wadoku_entries/1.xml
  def show
    @wadoku_entry = WadokuEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wadoku_entry }
    end
  end

  # GET /wadoku_entries/new
  # GET /wadoku_entries/new.xml
  def new
    @wadoku_entry = WadokuEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wadoku_entry }
    end
  end

  # GET /wadoku_entries/1/edit
  def edit
    @wadoku_entry = WadokuEntry.find(params[:id])
  end

  # POST /wadoku_entries
  # POST /wadoku_entries.xml
  def create
    @wadoku_entry = WadokuEntry.new(params[:wadoku_entry])

    respond_to do |format|
      if @wadoku_entry.save
        format.html { redirect_to(@wadoku_entry, :notice => 'Wadoku entry was successfully created.') }
        format.xml  { render :xml => @wadoku_entry, :status => :created, :location => @wadoku_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wadoku_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wadoku_entries/1
  # PUT /wadoku_entries/1.xml
  def update
    @wadoku_entry = WadokuEntry.find(params[:id])

    respond_to do |format|
      if @wadoku_entry.update_attributes(params[:wadoku_entry])
        format.html { redirect_to(@wadoku_entry, :notice => 'Wadoku entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wadoku_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wadoku_entries/1
  # DELETE /wadoku_entries/1.xml
  def destroy
    @wadoku_entry = WadokuEntry.find(params[:id])
    @wadoku_entry.destroy

    respond_to do |format|
      format.html { redirect_to(wadoku_entries_url) }
      format.xml  { head :ok }
    end
  end
end
