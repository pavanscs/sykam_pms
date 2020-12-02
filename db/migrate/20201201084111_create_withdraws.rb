class CreateWithdraws < ActiveRecord::Migration[6.0]
  def change
    create_table :withdraws do |t|
      t.decimal :amount
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
