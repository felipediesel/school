class BillGeneratorService
  attr_accessor :reference_date, :students

  def initialize(reference_date, students = nil)
    self.reference_date = reference_date.beginning_of_month

    self.students = students || Student.where.not(id: Bill.where(reference: reference_date)).includes(plans: :plan)
  end

  def call
    return false if self.students.blank?

    Bill.transaction do
      begin
        students.each do |student|
          create_bill student
        end
      rescue ActiveRecord::StatementInvalid
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
