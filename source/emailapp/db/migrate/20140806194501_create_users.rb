class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :confirmation_token
      t.datetime :confirmation_at
      t.string :invitation_token
      t.datetime :invitation_at

      t.timestamps
    end
  end
end
