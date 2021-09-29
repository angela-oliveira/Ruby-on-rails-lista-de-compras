class Listum < ApplicationRecord
  has_many :items, dependent: :destroy
  before_save :set_subtotal

  def subtotal
    items.collect { |item| item.valid? ? item.preco * item.quantidade : 0 }.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
