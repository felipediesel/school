class BillsController < ApplicationController
  before_action :set_bill, only: [ :edit, :update, :destroy]
  before_action :set_student

  # GET /bills
  # GET /bills.json
  def index
    @status = %w( not_paid paid overdue all ).include?(params[:status]) ? params[:status] : 'not_paid'

    @bills = get_bills.joins(:student).includes(:student).send(@status).order(:due_at, 'people.name', :created_at)
  end

  # GET /bills/new
  def new
    @bill = get_bills.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = get_bills.new bill_params

    respond_to do |format|
      if @bill.save
        format.html { redirect_to [ @student, :bills ], notice: t('.notice', description: @bill.description) }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to [ @student, :bills ], notice: t('.notice', description: @bill.description) }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to [ @student, :bills ], notice: t('.notice', description: @bill.description) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    def get_bills
      @student.present? ? @student.bills : Bill
    end

    def set_student
      @student = Student.find_by_id(params[:student_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      my_params = params.require(:bill).permit(:student_id, :description, :amount, :amount_formatted, :discount, :discount_formatted, :due_at, :paid, :paid_at)

      if my_params[:paid].present? and %w(0 false).include?(my_params[:paid])
        my_params.except! :paid_at, "paid_at(3i)", "paid_at(2i)", "paid_at(1i)"
      end

      my_params
    end
end
