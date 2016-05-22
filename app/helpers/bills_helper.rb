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

  def bill_reference_collection
    (0..11).to_a.map do |i|
      month = Date.today.beginning_of_month + i.months
      [ I18n.l(month, format: :month_year), month ]
    end
  end
end
