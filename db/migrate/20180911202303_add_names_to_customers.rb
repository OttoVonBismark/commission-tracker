class AddNamesToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :name, :string, null: false, default: "Nobody"
    add_column :customers, :email, :string, null: false, default: "nobody@example.com"
    add_column :customers, :remarks, :text
  end
end
