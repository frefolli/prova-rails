class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :fromId, null: false, foreign_key: {to_table: :accounts}
      t.references :toId, null: false, foreign_key: {to_talbe: :accounts}
      t.integer :amount
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
