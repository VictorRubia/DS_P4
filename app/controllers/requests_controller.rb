class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy approve getNumAleatorio ]


  def get_num
    @numero1 = rand(1000..9999).to_i
    @numero2 = rand(1000..9999).to_i
    @numero3 = rand(1000..9999).to_i
    @numero4 = rand(1000..9999).to_i
    @numero_tarjeta = @numero1.to_s + @numero2.to_s + @numero3.to_s + @numero4.to_s
  end

  def get_fecha
    @numero1 = rand(1..12).to_i
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
    @numero1 = rand(100..999).to_i
    @cvv = @numero1.to_s
  end

  def approve
    @request = Request.find(params[:id])

    if @request.tipo == 0
      @request.update_attribute(:solved, 1)
      @id_cuenta = @request.account_id
      @card = Card.new
      @card = Card.create(number: get_num(), account_id: @id_cuenta, fecha: get_fecha(), tipo: get_tipo(), cvv: get_cvv())
      @request.update_attribute(:id_objetivo, @card.id)
    end
    if @request.tipo == 1
      @request.update_attribute(:solved, 1)
      @id_cuenta = @request.account_id
      @id_prestamo = @request.id_objetivo
      @loan = Loan.find(@id_prestamo)
      @loan.update(account_id: @id_cuenta)
      @cuenta = Account.find(@id_cuenta)
      @saldo_anterior = @cuenta.amount
      @cuenta.update(amount: @saldo_anterior + @loan.amount)
      @transaccion = Transaction.new
      @transaccion = Transaction.create(amount: @loan.amount, account_id: @id_cuenta, concepto: "Prestamo")
    end

    redirect_to paginicio_index_path
  end

  def deny
    @request = Request.find(params[:id])
    @request.update_attribute(:solved, -1)

    if(@request.tipo == 1)
      @prestamo = Loan.find(@request.id_objetivo)
      @prestamo.destroy
    end

    redirect_to paginicio_index_path
  end



  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:id_objetivo, :tipo, :solved, :account_id)
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.permit(:number, :account_id, :fecha, :tipo, :cvv)
    end
end
