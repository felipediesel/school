class Bill < ApplicationRecord
  include DecimalFormatter

  belongs_to :student

  validates :student_id, presence: true
  validates :description, presence: true
  validates :amount, numericality: true
  validates :discount, numericality: true
  validates :total, numericality: true
  validates :due_at, presence: true

  decimal_format :amount, :discount

  def amount=(value)
    self.write_attribute :amount, value
    write_total value, discount
  end

  def discount=(value)
    self.write_attribute :discount, value
    write_total amount, value
  end

  def write_total(amount, discount = 0)
    amount ||= 0
    discount ||= 0
    self.write_attribute :total, amount - discount
  end
end
