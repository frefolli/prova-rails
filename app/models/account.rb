class Account < ApplicationRecord
  validates :name, length: {minimum: 1}
  validates :surname, length: {minimum: 1}
  validates :credit, numericality: {only_integer: true,
                                    greater_than_or_equal_to: 0}
  validates :fiscalcode, uniqueness: true
  validates :name, :surname, :credit, presence: true

  def transactions
    result = []
    
    Transaction.where(from: self).each do |t|
      result.append(t)
    end

    Transaction.where(to: self).each do |t|
      result.append(t)
    end
    
    return result
  end

  def destroy_transactions
    transactions.each do |t|
      puts "#{t.from.fiscalcode}, #{t.amount}"
      if t.from == self
        if t.to.nil?
          Transaction.delete(t)
        else
          t.from = nil
          puts t.save
        end
      else
        if t.from.nil?
          Transaction.delete(t)
        else
          t.to = nil
          puts t.save
        end
      end
    end
  end
end
