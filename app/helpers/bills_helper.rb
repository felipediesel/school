module BillsHelper
  def bill_tr_class(bill)
    if bill.paid?
      'bg-success-light'
    elsif bill.overdue?
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

  def bill_filter_dropdown
    dropdown_menu t('text.filter') do
      [ :not_paid, :paid, :overdue, :all ].collect do |field|
        link_to t("bills.index.filter.#{field}"), polymorphic_url(controller_name, status: field), class: 'dropdown-item'
      end.join.html_safe
    end
  end
end
