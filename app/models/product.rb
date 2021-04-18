class Product < ApplicationRecord
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  def add_amount( amount )
    self.amount += amount
    save
  end

  def cut_amount( amount )
    self.amount -= amount
    save
  end
end
