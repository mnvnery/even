class Bill < ApplicationRecord
  belongs_to :house
  has_many :shares, dependent: :destroy
  has_many :users, through: :shares

  def get_share_by_user(user)
    self.shares.where(user: user).first
  end

  def get_share_amount_by_user(user)
    user_share = get_share_by_user(user)
    user_share ? user_share.amount : 0
  end

  def formated_due_date
    self.due_date.strftime("%-d %B") if self.due_date
  end
end
