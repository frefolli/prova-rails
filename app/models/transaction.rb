class TransactionTypeValidator < ActiveModel::Validator
  def validate(record)
    if ((record.from.nil? and record.to.nil?) or
        (record.from == record.to))
      record.errors.add :base, "could be either a transaction, a deposit or a withdraw"
    end
  end
end

class Transaction < ApplicationRecord
  belongs_to :from, optional: true, class_name: "Account"
  belongs_to :to, optional: true, class_name: "Account"
  validates :amount, numericality: {only_integer: true,
                                    greater_than_or_equals: 0},
                     presence: true
  validates :timestamp, presence: true
  validates_with TransactionTypeValidator
end
