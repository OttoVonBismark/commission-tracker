class CreateCommissions < ActiveRecord::Migration[5.2]
  def change
    create_table :commissions do |t|
      t.timestamps
      t.references :customer_id, foreign_key: { to_table: :customers }, index: true
      t.date :date_commissioned, null: false
      t.float :price, null: false, precision: 2
      t.text :details, null: false
      t.boolean :has_paid, default: false
      t.date :date_paid
      t.boolean :is_finished, default: false
      t.date :date_finished
    end
  end
end
