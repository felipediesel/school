class BillGeneratorsController < ApplicationController
  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    bill_generator_service = BillGeneratorService.new(Date.parse(params[:bill_generator][:reference]))

    if bill_generator_service.call
      redirect_to :bills, notice: t('.notice')
    else
      redirect_to :bills, notice: t('.notice_error')
    end
  end
end
