class Share < ApplicationRecord
  before_save :set_paid_date

  belongs_to :user
  belongs_to :bill
  belongs_to :payment, optional: true
  monetize :amount_cents

  def self.create_shares_from_bill house, bill
  end

  def set_paid_date
    self.paid_date = Date.today if paid_changed?
  end

  def formated_paid_date
    self.paid_date.strftime("%-d %B") if self.paid_date
  end

end
