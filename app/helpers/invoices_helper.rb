module InvoicesHelper
  def invoice_month_collection
    (1..12).to_a.map do |i|
      month = Date.today.beginning_of_month + (i - 1).months
      [ I18n.l(month, format: :month_year), month ]
    end
  end
end
