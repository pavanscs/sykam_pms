class CreateStatements < ActiveRecord::Migration[6.0]
  def change
    create_table :statements do |t|
      t.decimal :referral_id
      t.string :statement
      t.decimal :amount
      t.string :action
      t.references :wallet, null: false, foreign_key: true
      t.references :withdraw, null: false, foreign_key: true
      t.references :deposit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
