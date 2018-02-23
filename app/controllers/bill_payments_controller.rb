class BillPaymentsController < ApplicationController
  before_action :set_bill

  def new
    render layout: 'modal'
  end

  def create
    respond_to do |format|
      format.json do
        if !@bill.update(bill_params)
          render json: @bill.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private
    def set_bill
      @bill = Bill.find(params[:bill_id])
      @bill.paid = true
    end

    def bill_params
      params.require(:bill).permit(:discount, :discount_formatted, :increase, :increase_formatted,  :paid_at)
    end
end
