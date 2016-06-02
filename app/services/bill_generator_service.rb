class BillGeneratorService
  attr_accessor :reference_date, :students, :created_bills

  def initialize(reference_date, students = nil)
    self.reference_date = reference_date.beginning_of_month
    self.students = students || Student.to_generate_bills(reference_date)
    self.created_bills = 0
  end

  def call
    return false if self.students.empty?

    Bill.transaction do
      begin
        students.each do |student|
          create_bill student
          self.created_bills += 1
        end
      rescue ActiveRecord::StatementInvalid
        self.created_bills = 0
        return false
      end
    end
    return true
  end

  def create_bill(student)
    student.bills.create reference: reference_date,
      description: I18n.t('bills.text.description', month: I18n.l(reference_date, format: :month_year)),
      amount: student.plans.collect(&:total_amount).sum,
      due_at: reference_date + Option.get(:invoice_day, 10).to_i.days - 1.days
  end
end
