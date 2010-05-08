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
    first_fix_time = ''

    @fixes.each do |fix|
      if fix['t'].is_a?(Array)
        fix['t'].each_with_index do |fix_time,index|
          if index == 0
            first_fix_time = fix_time
          end
          Fix.create!(
            :fix_time => Time.parse(fix_time.to_s), 
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
        first_fix_time = fix['t']
        Fix.create!(
          :fix_time => Time.parse(fix['t'].to_s), 
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
    render :json => {:fix_tlist => [first_fix_time]}
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
