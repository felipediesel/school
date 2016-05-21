class Bill < ApplicationRecord
  include DecimalFormatter

  belongs_to :student

  attr_accessor :paid

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

  def paid
    paid_at.present?
  end
  alias_method :paid?, :paid

  def paid=(value)
    value = ['1', 'true'].include?(value) unless !!value == value

    if value and value != '0'
      self.paid_at ||= lambda { Date.today }.call
    else
      self.paid_at = nil
    end
  end

  def late?
    due_at < lambda { Date.today }.call and !paid?
  end

  private

    def write_total(amount, discount = 0)
      amount ||= 0
      discount ||= 0
      self.write_attribute :total, amount - discount
    end
end
