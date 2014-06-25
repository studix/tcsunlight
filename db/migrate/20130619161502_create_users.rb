class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    # Now populate the users table with default user
    User.create :email => 'tennis@tcsunlight.ch', :password => 'sun4600light'
  end
end
