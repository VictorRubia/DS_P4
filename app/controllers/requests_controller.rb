class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy approve getNumAleatorio ]


  def get_num
    "PRUEBA"
  end

  def approve
    @request = Request.find(params[:id])

    if @request.tipo == 0
      @request.update_attribute(:solved, 1)
      @id_cuenta = @request.account_id
      @card = Card.new
      @card = Card.create(number: get_num(), account_id: @id_cuenta, fecha: "09/33", tipo: "VISA", cvv:"094")
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

  helper_method :aceptar

  def aceptar

    @request.solved = 1


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
