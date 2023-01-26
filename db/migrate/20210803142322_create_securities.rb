class CreateSecurities < ActiveRecord::Migration[6.1]
  def change
    create_table :securities do |t|
      t.string :security, null: false
      t.datetime :expiration, null: false
      t.integer :open_days
      t.float :value

      t.uuid :uuid, index: true, null: false, default: 'uuid_generate_v4()', unique: true
      t.references :order, index: true, foreign_key: { to_table: :orders }
      t.references :customer, index: true, foreign_key: { to_table: :customers }
      t.references :account, index: true, foreign_key: { to_table: :accounts }

      t.references :created_by, index: true, foreign_key: { to_table: :users }
      t.references :updated_by, index: true, foreign_key: { to_table: :users }

      t.boolean :active, index: true, default: true
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
