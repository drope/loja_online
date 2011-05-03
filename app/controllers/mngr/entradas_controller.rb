class Mngr::EntradasController < Mngr::BaseMngrController
  
  layout "mngr"
  
  # GET /entradas
  # GET /entradas.xml
  def index
    @entradas = Entrada.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entradas }
    end
  end

  # GET /entradas/1
  # GET /entradas/1.xml
  def show
    @entrada = Entrada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entrada }
    end
  end

  # GET /entradas/new
  # GET /entradas/new.xml
  def new
    @entrada = Entrada.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entrada }
    end
  end

  # GET /entradas/1/edit
  def edit
    @entrada = Entrada.find(params[:id])
  end

  # POST /entradas
  # POST /entradas.xml
  def create
    @entrada = Entrada.new(params[:entrada])

    respond_to do |format|
      if @entrada.save
        format.html { redirect_to([:mngr, @entrada], :notice => 'Entrada was successfully created.') }
        format.xml  { render :xml => @entrada, :status => :created, :location => @entrada }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entrada.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entradas/1
  # PUT /entradas/1.xml
  def update
    @entrada = Entrada.find(params[:id])

    respond_to do |format|
      if @entrada.update_attributes(params[:entrada])
        format.html { redirect_to([:mngr, @entrada], :notice => 'Entrada was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entrada.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entradas/1
  # DELETE /entradas/1.xml
  def destroy
    @entrada = Entrada.find(params[:id])
    @entrada.destroy

    respond_to do |format|
      format.html { redirect_to(mngr_entradas_url) }
      format.xml  { head :ok }
    end
  end
end
