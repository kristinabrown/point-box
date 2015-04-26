class AddRedeemedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :redeemed, :integer
  end
end
