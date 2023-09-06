class Account < ApplicationRecord
  validates :name, length: {minimum: 1}
  validates :surname, length: {minimum: 1}
  validates :credit, numericality: {only_integer: true,
                                    greater_than_or_equal_to: 0}
  validates :fiscalcode, uniqueness: true
  validates :name, :surname, :credit, presence: true
end
