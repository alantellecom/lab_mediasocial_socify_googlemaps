class RoutersController < ApplicationController
  before_action :set_router, only: [:show, :edit, :update, :destroy]

  # GET /routers
  def index
    @routers = Router.all
  end

  # GET /routers/1
  def show
  end

  # GET /routers/new
  def new
    @router = Router.new
  end

  # GET /routers/1/edit
  def edit
  end

  # POST /routers
  def create
    @router = Router.new(router_params)

    if @router.save
      redirect_to @router, notice: 'Router was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /routers/1
  def update
    if @router.update(router_params)
      redirect_to @router, notice: 'Router was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /routers/1
  def destroy
    @router.destroy
    redirect_to routers_url, notice: 'Router was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_router
      @router = Router.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def router_params
      params.require(:router).permit(:latitude, :longitude)
    end
end
