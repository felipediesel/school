class Bill < ApplicationRecord
  include DecimalFormatter

  belongs_to :student

  scope :not_paid, -> { where(paid_at: nil) }
  scope :paid, -> { where.not(paid_at: nil) }
  scope :overdue, -> { not_paid.where("due_at < ?", Date.today) }

  attr_accessor :paid

  validates :student_id, presence: true
  validates :description, presence: true
  validates :amount, numericality: true
  validates :discount, numericality: true
  validates :increase, numericality: true
  validates :total, numericality: true
  validates :due_at, presence: true

  decimal_format :amount, :discount, :increase

  def amount=(value)
    self.write_attribute :amount, value
    write_total value, discount, increase
  end

  def discount=(value)
    self.write_attribute :discount, value
    write_total amount, value, increase
  end

  def increase=(value)
    self.write_attribute :increase, value
    write_total amount, discount, value
  end

  def paid
    paid_at.present?
  end
  alias_method :paid?, :paid

  def paid=(value)
    value = ['1', 'true'].include?(value) unless !!value == value

    if value
      self.paid_at ||= lambda { Date.today }.call
    else
      self.paid_at = nil
    end
  end

  def overdue?
    due_at < lambda { Date.today }.call and !paid?
  end

  private

    def write_total(amount, discount = 0, increase = 0)
      amount ||= 0
      discount ||= 0
      increase ||= 0
      self.write_attribute :total, amount - discount + increase
    end
end
