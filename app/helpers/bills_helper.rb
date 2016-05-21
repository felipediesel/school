module BillsHelper
  def bill_tr_class(bill)
    if bill.paid?
      'bg-success-light'
    elsif bill.late?
      'bg-warning-light'
    else
      ''
    end
  end
end
