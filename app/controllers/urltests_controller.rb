class UrltestsController < ApplicationController
  before_action :set_urltest, only: %i[ show update destroy ]
  before_action :authenticate!
  # GET /urltests
  def index
    @urltests = Urltest.all

    render json: @urltests
  end

  # GET /urltests/1
  def show
    render json: @urltest
  end

  # POST /urltests
  def create
    @urltest = Urltest.new(urltest_params)

    if @urltest.save
      render json: @urltest, status: :created, location: @urltest
    else
      render json: @urltest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urltests/1
  def update
    if @urltest.update(urltest_params)
      render json: @urltest
    else
      render json: @urltest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urltests/1
  def destroy
    @urltest.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urltest
      @urltest = Urltest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def urltest_params
      params.require(:urltest).permit(:testName, :targetUrl)
    end
end
