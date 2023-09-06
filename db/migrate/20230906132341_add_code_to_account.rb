class AddCodeToAccount < ActiveRecord::Migration[7.0]
  def change
    change_table :accounts do |t|
      t.string :fiscalcode
    end
  end
end
