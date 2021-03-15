class RedirectsController < ApplicationController
  before_action :set_redirect, only: %i[ show edit update destroy ]

  # GET /redirects or /redirects.json
  def index
    @redirects = Redirect.all
  end

  # GET /redirects/1 or /redirects/1.json
  def show
  end

  # GET /redirects/new
  def new
    @redirect = Redirect.new
  end

  # GET /redirects/1/edit
  def edit
  end

  # POST /redirects or /redirects.json
  def create
    @redirect = Redirect.new(redirect_params)

      if @redirect.save
         link = Link.where(shorten_url:  @redirect.shorten_url).first 
         if link 
          @redirect = link.original_url
          redirect_to link.original_url , notice: "Redirect was successfully created." and return 
         else 
          redirect_to @redirect, notice: "Redirect was successfully created."
         end
      end
  end

  # PATCH/PUT /redirects/1 or /redirects/1.json
  def update
    respond_to do |format|
      if @redirect.update(redirect_params)
        format.html { redirect_to @redirect, notice: "Redirect was successfully updated." }
        format.json { render :show, status: :ok, location: @redirect }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redirects/1 or /redirects/1.json
  def destroy
    @redirect.destroy
    respond_to do |format|
      format.html { redirect_to redirects_url, notice: "Redirect was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redirect
      @redirect = Redirect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def redirect_params
      params.require(:redirect).permit(:shorten_url)
    end
end
