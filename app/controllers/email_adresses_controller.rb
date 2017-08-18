class EmailAdressesController < ApplicationController
  before_action :set_email_adress, only: [:show, :edit, :update, :destroy]

  # GET /email_adresses
  # GET /email_adresses.json
  def index
    @email_adresses = EmailAdress.all
  end

  # GET /email_adresses/1
  # GET /email_adresses/1.json
  def show
  end

  # GET /email_adresses/new
  def new
    @email_adress = EmailAdress.new(person_id: params[:person_id])
  end

  # GET /email_adresses/1/edit
  def edit
  end

  # POST /email_adresses
  # POST /email_adresses.json
  def create
    @email_adress = EmailAdress.new(email_adress_params)

    respond_to do |format|
      if @email_adress.save
        format.html { redirect_to @email_adress.person, notice: 'Email adress was successfully created.' }
        format.json { render :show, status: :created, location: @email_adress }
      else
        format.html { render :new }
        format.json { render json: @email_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_adresses/1
  # PATCH/PUT /email_adresses/1.json
  def update
    respond_to do |format|
      if @email_adress.update(email_adress_params)
        format.html { redirect_to @email_adress.person, notice: 'Email adress was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_adress }
      else
        format.html { render :edit }
        format.json { render json: @email_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_adresses/1
  # DELETE /email_adresses/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to @email_adress.person, notice: 'Email adress was successfully destroyed.' }
      format.json { head :no_content }
    end
    @email_adress.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_adress
      @email_adress = EmailAdress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_adress_params
      params.require(:email_adress).permit(:adress, :person_id)
    end
end
