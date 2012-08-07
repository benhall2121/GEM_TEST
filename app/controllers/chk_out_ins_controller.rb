class ChkOutInsController < ApplicationController
  # GET /chk_out_ins
  # GET /chk_out_ins.xml
  def index
    @chk_out_ins = ChkOutIn.all(:order => 'ISNULL(checkedInTime) desc, checkedInTime desc, checkedOutTime')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chk_out_ins }
    end
  end

  # GET /chk_out_ins/1
  # GET /chk_out_ins/1.xml
  def show
    @chk_out_in = ChkOutIn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chk_out_in }
    end
  end

  # GET /chk_out_ins/new
  # GET /chk_out_ins/new.xml
  def new
    @chk_out_in = ChkOutIn.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chk_out_in }
    end
  end

  # GET /chk_out_ins/1/edit
  def edit
    @chk_out_in = ChkOutIn.find(params[:id])
  end

  # POST /chk_out_ins
  # POST /chk_out_ins.xml
  def create
    @chk_out_in = ChkOutIn.new(params[:chk_out_in])

    respond_to do |format|
      if @chk_out_in.save
        format.html { redirect_to(@chk_out_in, :notice => 'Chk out in was successfully created.') }
        format.xml  { render :xml => @chk_out_in, :status => :created, :location => @chk_out_in }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chk_out_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chk_out_ins/1
  # PUT /chk_out_ins/1.xml
  def update
    @chk_out_in = ChkOutIn.find(params[:id])

    respond_to do |format|
      if @chk_out_in.update_attributes(params[:chk_out_in])
        format.html { redirect_to(@chk_out_in, :notice => 'Chk out in was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chk_out_in.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chk_out_ins/1
  # DELETE /chk_out_ins/1.xml
  def destroy
    @chk_out_in = ChkOutIn.find(params[:id])
    @chk_out_in.destroy

    respond_to do |format|
      format.html { redirect_to(chk_out_ins_url) }
      format.xml  { head :ok }
    end
  end

  def checked_out_assets
    employee_id = Employee.find_by_idString(params[:employee_id]).id

    if !employee_id.nil?
      @chk_out_in = ChkOutIn.find(:all, :conditions => ["employee_id = ? && checkedInTime IS NULL",employee_id])

      render :json => @chk_out_in.to_json(:include => [:asset, :employee])
    else          
      json_error_response(404, "Missing params")
    end
  end

  def check_out_asset_return_details
    asset_id = Asset.find_by_idString(params[:asset_id]).id
    employee_id = Employee.find_by_idString(params[:employee_id]).id
    already_checked_out = ChkOutIn.find(:first, :conditions => ['asset_id = ? && checkedInTime IS NULL', asset_id])

    if !asset_id.nil? && !employee_id.nil? && already_checked_out.nil?
      @chk_out_in = ChkOutIn.new(:asset_id => asset_id, :employee_id => employee_id, :checkedOutTime => Time.now)
      @chk_out_in.save

      render :json => @chk_out_in.to_json(:include => [:asset, :employee])
    else       
      json_error_response(404, "Missing params")
    end
  end

  def get_asset
    asset_id = Asset.find_by_idString(params[:asset_id]).id

    if !asset_id.nil?
      @asset_in = ChkOutIn.find(:first, :conditions => ["asset_id = ? && checkedInTime IS NULL",asset_id])
      render :json => @asset_in.to_json(:include => [:asset, :employee])
    else
      json_error_response(404, "Missing params")
    end

  end

  def checkin_asset
    asset_id = Asset.find_by_idString(params[:asset_id]).id

    if !asset_id.nil?
      @asset_in = ChkOutIn.find(:first, :conditions => ["asset_id = ? && checkedInTime IS NULL",asset_id])

      @asset_in.update_attributes(:checkedInTime => Time.now)

      render :json => @asset_in.to_json(:include => [:asset, :employee])
    else
      json_error_response(404, "Missing params")
    end

  end

end
