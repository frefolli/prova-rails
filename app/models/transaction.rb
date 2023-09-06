class TransactionTypeValidator < ActiveModel::Validator
  def validate(record)
    if record[:fromId].nil? and record[:fromId].nil?
      record.errors.add :base, "could be either a transaction, a deposit or a withdraw"
    end
  end
end

class Transaction < ApplicationRecord
  belongs_to :fromId
  belongs_to :toId
  validates :amount, numericality: {only_integers: true,
                                    greater_than_or_equals: 0},
                     presence: true
  validates :timestamp, presence: true
  validates_with TransactionTypeValidator
end
