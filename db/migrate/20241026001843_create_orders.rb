class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :orders do |t|
      t.uuid :identifier, default: "gen_random_uuid()", null: false
      t.integer :status, null: false, default: 0
      t.datetime :order_prepared_at

      t.references :deposit, foreign_key: true, null: false
      t.index :identifier, unique: true
      t.timestamps
    end
  end
end
