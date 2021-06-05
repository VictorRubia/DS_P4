class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # POST /ajax/sum
  def aceptar_prestamo
    #    @prestamo = Loan.find_by(idPrestamo)

    num1 = params["num1"].to_i
    num2 = params["num2"].to_i
    # Do something with input parameter and respond as JSON with the output
    result = num1 + num2

    respond_to do |format|
      format.json {render :json => {:result => result}}
    end
  end

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  def get_num
    @numero1 = (rand*9999 + 1000).to_i
    @numero2 = (rand*9999 + 1000).to_i
    @numero3 = (rand*9999 + 1000).to_i
    @numero4 = (rand*9999 + 1000).to_i
    @numero_tarjeta = @numero1.to_s + "-" + @numero2.to_s + "-" + @numero3.to_s + "-" + @numero4.to_s
  end

  def get_fecha
    @numero1 = (rand*12 + 1).to_i
    @numero2 = rand(22..35).to_i
    @numero_tarjeta = @numero1.to_s + "/" + @numero2.to_s
  end

  def get_tipo
    @numero1 = rand(1..2).to_i
    if(@numero1 == 1)
      @tipo = "VISA"
    else
      @tipo = "MASTERCARD"
    end
    @tipo
  end

  def get_cvv
    @numero1 = (rand*999 + 100).to_i
    @cvv = @numero1.to_s
  end


  # POST /accounts or /accounts.json
  def create
    #account_params[:iban] = "12345678"
    #account_params.update_attribute(:iban, "probandooo")
    #puts account_params[:iban]

    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end

    @card = Card.new
    @card = Card.create(number: get_num(), account_id: @account.id, fecha: get_fecha(), tipo: get_tipo(), cvv: get_cvv())
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @solicitudes = Request.where(account_id: @account.id)

    @solicitudes.each do |request|
      request.destroy
    end

    @prestamos = Loan.where(account_id: @account.id)

    @prestamos.each do |loan|
      loan.destroy
    end

    @tarjetas = Card.where(account_id: @account.id)

    @tarjetas.each do |tarjeta|
      tarjeta.destroy
    end

    @inversiones = Investment.where(account_id: @account.id)

    @inversiones.each do |inversion|
      inversion.destroy
    end

    @transacciones = Transaction.where(account_id: @account.id)

    @transacciones.each do |transaccion|
      transaccion.destroy
    end

    @transferencias = Transfer.where(account_id: @account.id)

    @transferencias.each do |transferencia|
      transferencia.destroy
    end

    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :dni, :password, :nomina, :iban, :amount)
    end
end
