class BillPaymentsController < ApplicationController
  before_action :set_bill

  def new
    render layout: 'modal'
  end

  def create
    render :new if ! @bill.update_attributes(bill_params)
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
