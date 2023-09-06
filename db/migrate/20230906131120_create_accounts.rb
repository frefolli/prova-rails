class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :surname
      t.integer :credit

      t.timestamps
    end
  end
end
