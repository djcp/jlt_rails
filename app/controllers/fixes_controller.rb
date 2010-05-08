class FixesController < ApplicationController
  # GET /fixes
  # GET /fixes.xml
  def index
    @fixes = Fix.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fixes }
    end
  end

  # GET /fixes/1
  # GET /fixes/1.xml
  def show
    @fix = Fix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fix }
    end
  end

  # GET /fixes/new
  # GET /fixes/new.xml
  def new
    @fix = Fix.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fix }
    end
  end

  # GET /fixes/1/edit
  def edit
    @fix = Fix.find(params[:id])
  end

  # POST /fixes
  # POST /fixes.xml
  def create
    @fixes = ActiveSupport::JSON.decode(params[:fixes])
    @fixes.each do |fix|
      if fix['t'].is_a?(Array)
        fix['t'].each do |fix_time|
          Fix.create!(
            :fix_time => fix_time, 
            :latitude => fix['ll'][0], 
            :longitude => fix['ll'][1], 
            :horiz_accuracy => fix['ha'],
            :vert_accuracy => fix['va'],
            :altitude => fix['al'],
            :velocity => fix['vv'][0],
            :heading => fix['vv'][1]
          )
        end
      else
        Fix.create!(
          :fix_time => fix['t'], 
          :latitude => fix['ll'][0], 
          :longitude => fix['ll'][1], 
          :horiz_accuracy => fix['ha'],
          :vert_accuracy => fix['va'],
          :altitude => fix['al'],
          :velocity => fix['vv'][0],
          :heading => fix['vv'][1]
        )
      end
    end

    @fix = Fix.new(params[:fix])

    respond_to do |format|
      if @fix.save
        flash[:notice] = 'Fix was successfully created.'
        format.html { redirect_to(@fix) }
        format.xml  { render :xml => @fix, :status => :created, :location => @fix }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fixes/1
  # PUT /fixes/1.xml
  def update
    @fix = Fix.find(params[:id])

    respond_to do |format|
      if @fix.update_attributes(params[:fix])
        flash[:notice] = 'Fix was successfully updated.'
        format.html { redirect_to(@fix) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fixes/1
  # DELETE /fixes/1.xml
  def destroy
    @fix = Fix.find(params[:id])
    @fix.destroy

    respond_to do |format|
      format.html { redirect_to(fixes_url) }
      format.xml  { head :ok }
    end
  end
end
