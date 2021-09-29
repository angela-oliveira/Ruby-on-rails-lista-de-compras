class Item < ApplicationRecord
  belongs_to :listum
  before_save :set_preco
  before_save :set_total

  def total
    preco * quantidade
  end

  private

  def set_preco
    self[:preco] = preco
  end

  def set_total
    self[:total] = total * quantidade
  end
end
