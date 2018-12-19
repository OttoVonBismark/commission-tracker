class CreateCommissions < ActiveRecord::Migration[5.2]
  def change
    create_table :commissions do |t|
      t.timestamps
      t.references :name, foreign_key: { to_table: :customers }, index: true
      t.datetime :date_commissioned, null: false
      t.float :price, null: false, precision: 2
      t.text :details, null: false
      t.boolean :has_paid, default: false
      t.datetime :date_paid
      t.boolean :is_finished, default: false
      t.datetime :date_finished
    end
  end
end
