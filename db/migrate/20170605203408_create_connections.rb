class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :request_accepted

      t.timestamps

    end
  end
end
