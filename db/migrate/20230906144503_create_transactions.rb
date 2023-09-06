class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :from, null: true, foreign_key: {to_table: :accounts}
      t.references :to, null: true, foreign_key: {to_table: :accounts}
      t.integer :amount
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
